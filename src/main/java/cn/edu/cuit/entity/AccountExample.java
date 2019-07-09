package cn.edu.cuit.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AccountExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AccountExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andAcidIsNull() {
            addCriterion("acid is null");
            return (Criteria) this;
        }

        public Criteria andAcidIsNotNull() {
            addCriterion("acid is not null");
            return (Criteria) this;
        }

        public Criteria andAcidEqualTo(Integer value) {
            addCriterion("acid =", value, "acid");
            return (Criteria) this;
        }

        public Criteria andAcidNotEqualTo(Integer value) {
            addCriterion("acid <>", value, "acid");
            return (Criteria) this;
        }

        public Criteria andAcidGreaterThan(Integer value) {
            addCriterion("acid >", value, "acid");
            return (Criteria) this;
        }

        public Criteria andAcidGreaterThanOrEqualTo(Integer value) {
            addCriterion("acid >=", value, "acid");
            return (Criteria) this;
        }

        public Criteria andAcidLessThan(Integer value) {
            addCriterion("acid <", value, "acid");
            return (Criteria) this;
        }

        public Criteria andAcidLessThanOrEqualTo(Integer value) {
            addCriterion("acid <=", value, "acid");
            return (Criteria) this;
        }

        public Criteria andAcidIn(List<Integer> values) {
            addCriterion("acid in", values, "acid");
            return (Criteria) this;
        }

        public Criteria andAcidNotIn(List<Integer> values) {
            addCriterion("acid not in", values, "acid");
            return (Criteria) this;
        }

        public Criteria andAcidBetween(Integer value1, Integer value2) {
            addCriterion("acid between", value1, value2, "acid");
            return (Criteria) this;
        }

        public Criteria andAcidNotBetween(Integer value1, Integer value2) {
            addCriterion("acid not between", value1, value2, "acid");
            return (Criteria) this;
        }

        public Criteria andTidIsNull() {
            addCriterion("tid is null");
            return (Criteria) this;
        }

        public Criteria andTidIsNotNull() {
            addCriterion("tid is not null");
            return (Criteria) this;
        }

        public Criteria andTidEqualTo(Integer value) {
            addCriterion("tid =", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidNotEqualTo(Integer value) {
            addCriterion("tid <>", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidGreaterThan(Integer value) {
            addCriterion("tid >", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidGreaterThanOrEqualTo(Integer value) {
            addCriterion("tid >=", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidLessThan(Integer value) {
            addCriterion("tid <", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidLessThanOrEqualTo(Integer value) {
            addCriterion("tid <=", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidIn(List<Integer> values) {
            addCriterion("tid in", values, "tid");
            return (Criteria) this;
        }

        public Criteria andTidNotIn(List<Integer> values) {
            addCriterion("tid not in", values, "tid");
            return (Criteria) this;
        }

        public Criteria andTidBetween(Integer value1, Integer value2) {
            addCriterion("tid between", value1, value2, "tid");
            return (Criteria) this;
        }

        public Criteria andTidNotBetween(Integer value1, Integer value2) {
            addCriterion("tid not between", value1, value2, "tid");
            return (Criteria) this;
        }

        public Criteria andUidIsNull() {
            addCriterion("uid is null");
            return (Criteria) this;
        }

        public Criteria andUidIsNotNull() {
            addCriterion("uid is not null");
            return (Criteria) this;
        }

        public Criteria andUidEqualTo(Integer value) {
            addCriterion("uid =", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotEqualTo(Integer value) {
            addCriterion("uid <>", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidGreaterThan(Integer value) {
            addCriterion("uid >", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidGreaterThanOrEqualTo(Integer value) {
            addCriterion("uid >=", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidLessThan(Integer value) {
            addCriterion("uid <", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidLessThanOrEqualTo(Integer value) {
            addCriterion("uid <=", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidIn(List<Integer> values) {
            addCriterion("uid in", values, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotIn(List<Integer> values) {
            addCriterion("uid not in", values, "uid");
            return (Criteria) this;
        }

        public Criteria andUidBetween(Integer value1, Integer value2) {
            addCriterion("uid between", value1, value2, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotBetween(Integer value1, Integer value2) {
            addCriterion("uid not between", value1, value2, "uid");
            return (Criteria) this;
        }

        public Criteria andIetypeIsNull() {
            addCriterion("IEType is null");
            return (Criteria) this;
        }

        public Criteria andIetypeIsNotNull() {
            addCriterion("IEType is not null");
            return (Criteria) this;
        }

        public Criteria andIetypeEqualTo(Integer value) {
            addCriterion("IEType =", value, "ietype");
            return (Criteria) this;
        }

        public Criteria andIetypeNotEqualTo(Integer value) {
            addCriterion("IEType <>", value, "ietype");
            return (Criteria) this;
        }

        public Criteria andIetypeGreaterThan(Integer value) {
            addCriterion("IEType >", value, "ietype");
            return (Criteria) this;
        }

        public Criteria andIetypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("IEType >=", value, "ietype");
            return (Criteria) this;
        }

        public Criteria andIetypeLessThan(Integer value) {
            addCriterion("IEType <", value, "ietype");
            return (Criteria) this;
        }

        public Criteria andIetypeLessThanOrEqualTo(Integer value) {
            addCriterion("IEType <=", value, "ietype");
            return (Criteria) this;
        }

        public Criteria andIetypeIn(List<Integer> values) {
            addCriterion("IEType in", values, "ietype");
            return (Criteria) this;
        }

        public Criteria andIetypeNotIn(List<Integer> values) {
            addCriterion("IEType not in", values, "ietype");
            return (Criteria) this;
        }

        public Criteria andIetypeBetween(Integer value1, Integer value2) {
            addCriterion("IEType between", value1, value2, "ietype");
            return (Criteria) this;
        }

        public Criteria andIetypeNotBetween(Integer value1, Integer value2) {
            addCriterion("IEType not between", value1, value2, "ietype");
            return (Criteria) this;
        }

        public Criteria andDateIsNull() {
            addCriterion("date is null");
            return (Criteria) this;
        }

        public Criteria andDateIsNotNull() {
            addCriterion("date is not null");
            return (Criteria) this;
        }

        public Criteria andDateEqualTo(Date value) {
            addCriterion("date =", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotEqualTo(Date value) {
            addCriterion("date <>", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThan(Date value) {
            addCriterion("date >", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThanOrEqualTo(Date value) {
            addCriterion("date >=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThan(Date value) {
            addCriterion("date <", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThanOrEqualTo(Date value) {
            addCriterion("date <=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateIn(List<Date> values) {
            addCriterion("date in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotIn(List<Date> values) {
            addCriterion("date not in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateBetween(Date value1, Date value2) {
            addCriterion("date between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotBetween(Date value1, Date value2) {
            addCriterion("date not between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andAmountIsNull() {
            addCriterion("amount is null");
            return (Criteria) this;
        }

        public Criteria andAmountIsNotNull() {
            addCriterion("amount is not null");
            return (Criteria) this;
        }

        public Criteria andAmountEqualTo(Long value) {
            addCriterion("amount =", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountNotEqualTo(Long value) {
            addCriterion("amount <>", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountGreaterThan(Long value) {
            addCriterion("amount >", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountGreaterThanOrEqualTo(Long value) {
            addCriterion("amount >=", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountLessThan(Long value) {
            addCriterion("amount <", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountLessThanOrEqualTo(Long value) {
            addCriterion("amount <=", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountIn(List<Long> values) {
            addCriterion("amount in", values, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountNotIn(List<Long> values) {
            addCriterion("amount not in", values, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountBetween(Long value1, Long value2) {
            addCriterion("amount between", value1, value2, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountNotBetween(Long value1, Long value2) {
            addCriterion("amount not between", value1, value2, "amount");
            return (Criteria) this;
        }

        public Criteria andRemarksIsNull() {
            addCriterion("remarks is null");
            return (Criteria) this;
        }

        public Criteria andRemarksIsNotNull() {
            addCriterion("remarks is not null");
            return (Criteria) this;
        }

        public Criteria andRemarksEqualTo(String value) {
            addCriterion("remarks =", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotEqualTo(String value) {
            addCriterion("remarks <>", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksGreaterThan(String value) {
            addCriterion("remarks >", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksGreaterThanOrEqualTo(String value) {
            addCriterion("remarks >=", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksLessThan(String value) {
            addCriterion("remarks <", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksLessThanOrEqualTo(String value) {
            addCriterion("remarks <=", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksLike(String value) {
            addCriterion("remarks like", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotLike(String value) {
            addCriterion("remarks not like", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksIn(List<String> values) {
            addCriterion("remarks in", values, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotIn(List<String> values) {
            addCriterion("remarks not in", values, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksBetween(String value1, String value2) {
            addCriterion("remarks between", value1, value2, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotBetween(String value1, String value2) {
            addCriterion("remarks not between", value1, value2, "remarks");
            return (Criteria) this;
        }

        public Criteria andIsExposeIsNull() {
            addCriterion("is_expose is null");
            return (Criteria) this;
        }

        public Criteria andIsExposeIsNotNull() {
            addCriterion("is_expose is not null");
            return (Criteria) this;
        }

        public Criteria andIsExposeEqualTo(Integer value) {
            addCriterion("is_expose =", value, "isExpose");
            return (Criteria) this;
        }

        public Criteria andIsExposeNotEqualTo(Integer value) {
            addCriterion("is_expose <>", value, "isExpose");
            return (Criteria) this;
        }

        public Criteria andIsExposeGreaterThan(Integer value) {
            addCriterion("is_expose >", value, "isExpose");
            return (Criteria) this;
        }

        public Criteria andIsExposeGreaterThanOrEqualTo(Integer value) {
            addCriterion("is_expose >=", value, "isExpose");
            return (Criteria) this;
        }

        public Criteria andIsExposeLessThan(Integer value) {
            addCriterion("is_expose <", value, "isExpose");
            return (Criteria) this;
        }

        public Criteria andIsExposeLessThanOrEqualTo(Integer value) {
            addCriterion("is_expose <=", value, "isExpose");
            return (Criteria) this;
        }

        public Criteria andIsExposeIn(List<Integer> values) {
            addCriterion("is_expose in", values, "isExpose");
            return (Criteria) this;
        }

        public Criteria andIsExposeNotIn(List<Integer> values) {
            addCriterion("is_expose not in", values, "isExpose");
            return (Criteria) this;
        }

        public Criteria andIsExposeBetween(Integer value1, Integer value2) {
            addCriterion("is_expose between", value1, value2, "isExpose");
            return (Criteria) this;
        }

        public Criteria andIsExposeNotBetween(Integer value1, Integer value2) {
            addCriterion("is_expose not between", value1, value2, "isExpose");
            return (Criteria) this;
        }

        public Criteria andIsAvaliableIsNull() {
            addCriterion("is_avaliable is null");
            return (Criteria) this;
        }

        public Criteria andIsAvaliableIsNotNull() {
            addCriterion("is_avaliable is not null");
            return (Criteria) this;
        }

        public Criteria andIsAvaliableEqualTo(Integer value) {
            addCriterion("is_avaliable =", value, "isAvaliable");
            return (Criteria) this;
        }

        public Criteria andIsAvaliableNotEqualTo(Integer value) {
            addCriterion("is_avaliable <>", value, "isAvaliable");
            return (Criteria) this;
        }

        public Criteria andIsAvaliableGreaterThan(Integer value) {
            addCriterion("is_avaliable >", value, "isAvaliable");
            return (Criteria) this;
        }

        public Criteria andIsAvaliableGreaterThanOrEqualTo(Integer value) {
            addCriterion("is_avaliable >=", value, "isAvaliable");
            return (Criteria) this;
        }

        public Criteria andIsAvaliableLessThan(Integer value) {
            addCriterion("is_avaliable <", value, "isAvaliable");
            return (Criteria) this;
        }

        public Criteria andIsAvaliableLessThanOrEqualTo(Integer value) {
            addCriterion("is_avaliable <=", value, "isAvaliable");
            return (Criteria) this;
        }

        public Criteria andIsAvaliableIn(List<Integer> values) {
            addCriterion("is_avaliable in", values, "isAvaliable");
            return (Criteria) this;
        }

        public Criteria andIsAvaliableNotIn(List<Integer> values) {
            addCriterion("is_avaliable not in", values, "isAvaliable");
            return (Criteria) this;
        }

        public Criteria andIsAvaliableBetween(Integer value1, Integer value2) {
            addCriterion("is_avaliable between", value1, value2, "isAvaliable");
            return (Criteria) this;
        }

        public Criteria andIsAvaliableNotBetween(Integer value1, Integer value2) {
            addCriterion("is_avaliable not between", value1, value2, "isAvaliable");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}