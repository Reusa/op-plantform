package com.lakinm.op.service.impl;

import com.lakinm.op.common.enums.PlanFrequencyType;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.model.dto.PlanCollectionDTO;
import com.lakinm.op.model.dto.PlanDTO;
import com.lakinm.op.model.entity.Plan;
import com.lakinm.op.model.entity.PlanCollection;
import com.lakinm.op.model.entity.PlanSchedule;
import com.lakinm.op.model.mapper.PlanCollectionMapper;
import com.lakinm.op.model.mapper.PlanMapper;
import com.lakinm.op.model.mapper.PlanScheduleMapper;
import com.lakinm.op.model.vo.PlanVo;
import com.lakinm.op.request.CollectionRequest;
import com.lakinm.op.request.PlanRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.PlanService;
import com.lakinm.op.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
@Transactional(rollbackFor = Exception.class)
public class PlanServiceImpl implements PlanService {

    @Autowired
    private UserService userService;

    @Autowired
    private PlanMapper planMapper;

    @Autowired
    private PlanCollectionMapper planCollectionMapper;

    @Autowired
    private PlanScheduleMapper planScheduleMapper;

    @Override
    public Result addPlan(String token, PlanRequest request) {
        String userId = userService.checkToken(token).getId();
        Plan plan = new Plan();
        plan.setName(request.getName());
        plan.setVersionId(request.getVersionId());
        plan.setDescription(request.getDescription());
        plan.setEnvironmentId(request.getEnvironmentId());
        plan.setRetry(request.getRetry());
        plan.setEngineId(request.getEngineId());
        plan.setProjectId(request.getProjectId());
        plan.setUpdateTime(System.currentTimeMillis());
        plan.setUpdateUser(userId);
        if (request.getId() == null || request.getId().equals("")) {
            plan.setId(UUID.randomUUID().toString());
            plan.setCreateTime(System.currentTimeMillis());
            plan.setCreateUser(userId);
            // 插入关联的执行规则
            PlanSchedule planSchedule = new PlanSchedule();
            planSchedule.setId(UUID.randomUUID().toString());
            planSchedule.setPlanId(plan.getId());
            planSchedule.setFrequency(request.getFrequency());
            planSchedule.setStartTime(request.getStartTime());
            planSchedule.setNextRunTime(getNextRunTime(convertTime(request.getStartTime()), request.getFrequency()));
            planMapper.insertPlan(plan);
            planScheduleMapper.insertSchedule(planSchedule);
        } else {
            plan.setId(request.getId());
            PlanSchedule planSchedule = planScheduleMapper.selectScheduleByPlanId(request.getId());
            if (planSchedule == null) {
                return Result.fail(ResultEnum.FAILED.getCode(), ResultEnum.FAILED.getMessage());
            }
            // 重新计算关联规则的下一次执行时间并更新
            planSchedule.setStartTime(request.getStartTime());
            planSchedule.setFrequency(request.getFrequency());
            planSchedule.setNextRunTime(getNextRunTime(convertTime(request.getStartTime()), request.getFrequency()));
            planScheduleMapper.updateScheduleById(planSchedule);
            planMapper.updatePlanById(plan);
        }
        // 插入计划关联的集合
        // 更新时先删除计划原来关联的集合
        planCollectionMapper.deleteCollectionByPlanId(plan.getId());
        List<PlanCollection> planCollections = new ArrayList<>();
        for (CollectionRequest temp : request.getCollections()) {
            PlanCollection p1 = new PlanCollection();
            p1.setId(UUID.randomUUID().toString());
            p1.setPlanId(plan.getId());
            p1.setCollectionId(temp.getId());
            planCollections.add(p1);
        }
        if (planCollections.size() > 0) {
            planCollectionMapper.insertPlanCollection(planCollections);
        }

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), plan);
    }

    @Override
    public Result deletePlan(String planId) {
        planMapper.deletePlanById(planId);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }

    @Override
    public Result getPlanDetail(String planId) {
        PlanDTO planDTO = planMapper.selectPlanById(planId);
        List<PlanCollectionDTO> planCollectionDTOS = planCollectionMapper.selectCollectionByPlanId(planId);
        planDTO.setPlanCollections(planCollectionDTOS);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), planDTO);
    }

    @Override
    public List<PlanVo> getPlanList(QueryRequest request) {
        String projectId = request.getProjectId();
        String condition = request.getCondition();
        if (condition != null && !condition.equals("")) {
            condition = "%" + condition + "%";
        }
        List<PlanDTO> planDTOS = planMapper.selectPlanListByCondition(projectId, condition);
        List<PlanVo> planVos = new ArrayList<>();
        for (PlanDTO temp : planDTOS) {
            PlanVo planVo = new PlanVo();
            planVo.setId(temp.getId());
            planVo.setName(temp.getName());
            planVo.setVersionId(temp.getVersionId());
            planVo.setVersionName(temp.getVersionName());
            planVo.setDescription(temp.getDescription());
            planVo.setEnvironmentId(temp.getEnvironmentId());
            planVo.setEnvironmentName(temp.getEnvironmentName());
            planVo.setRetry(temp.getRetry());
            planVo.setFrequency(temp.getFrequency());
            planVo.setCreateUser(temp.getCreateUser());
            planVo.setUsername(temp.getUsername());
            planVo.setUpdateTime(temp.getUpdateTime());
            planVos.add(planVo);
        }
        return planVos;
    }

    public static Long convertTime(String time) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = dateFormat.parse(time);
            return date.getTime();
        } catch (Exception e) {
            return 0L;
        }
    }

    public static String timeConvertToData(Long time) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String sd = dateFormat.format(new Date(time));
            return sd;
        } catch (Exception e) {
            return "1900-00-00 00:00:00";
        }
    }

    public static Long getNextRunTime(Long lastTime, String frequency) {
        if (frequency.equals(PlanFrequencyType.HALF_HOUR.getType())) {
            return lastTime + 30*60*1000;
        } else if (frequency.equals(PlanFrequencyType.EVERY_HOUR.getType())) {
            return lastTime + 60*60*1000;
        } else if (frequency.equals(PlanFrequencyType.HALF_DAY.getType())) {
            return lastTime + 12*60*60*1000;
        } else if (frequency.equals(PlanFrequencyType.EVERY_DAY.getType())) {
            return lastTime + 24*60*60*1000;
        } else if (frequency.equals(PlanFrequencyType.EVERY_WEEK.getType())) {
            return lastTime + 7*24*60*60*1000;
        } else if (frequency.equals(PlanFrequencyType.EVERY_MONTH.getType())) {
            Calendar c = Calendar.getInstance();
            c.setTime(new Date(lastTime));
            c.add(Calendar.MONTH, 1);
            return c.getTimeInMillis();
        } else {
            return lastTime;
        }
    }
}
