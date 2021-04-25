package com.fh.util;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Sets;



public class myUtils{
	
	public static final float factor = 0.74f;
	public static final String EMPTY = StringUtils.EMPTY;
	public static final String SPACE = StringUtils.SPACE;

	/*MAP & LIST & SET new instance工具*/
	public static Map newHashMap() {
		return Maps.newHashMap();
	}
	
	public static Map newHashMap(int expectedSize) {
		return Maps.newHashMapWithExpectedSize(Math.round(expectedSize / factor));
	}
	
	public static Map newLinkedHashMap() {
		return Maps.newLinkedHashMap();
	}
	
	public static Map newLinkedHashMap(int expectedSize) {
		return Maps.newLinkedHashMapWithExpectedSize(Math.round(expectedSize / factor));
	}
	
	public static Set newHashSet() {
		return Sets.newHashSet();
	}
	
	public static Set newHashSet(int expectedSize) {
		return Sets.newHashSetWithExpectedSize(Math.round(expectedSize / factor));
	}
	
	public static List newArrayList() {
		return Lists.newArrayList();
	}
	
	public static List newArrayListWithExpectedSize(int estimatedSize) {
		return Lists.newArrayListWithExpectedSize(Math.round(estimatedSize / factor));
	}
	
	public static List newLinkedList() {
		return Lists.newLinkedList();
	}
	
	
	
	/*STRING工具*/
	public static boolean isNotEmpty(String cs) {
		return StringUtils.isNotEmpty(cs);
	}
	
	public static boolean isEmpty(String cs) {
		return StringUtils.isEmpty(cs);
	}
	
	public static boolean isNotBlank(String cs) {
		return StringUtils.isNotBlank(cs);
	}
	
	public static boolean isBlank(String cs) {
		return StringUtils.isBlank(cs);
	}
	
	public static String isEmptyReturnCreate(String cs) {
		if(StringUtils.isEmpty(cs))
			return StringUtils.EMPTY;
		return cs;
	}
	
	public static String isBlankReturnCreate(String cs) {
		if(StringUtils.isBlank(cs))
			return StringUtils.EMPTY;
		return cs;
	}
	
	public static String isBlankReturnNull(String cs) {
		if(StringUtils.isBlank(cs))
			return null;
		return cs;
	}
	
	public static boolean equals(String cs1,String cs2) {
		return StringUtils.equals(cs1, cs2);
	}
	
	public static boolean equalsIgnoreCase(String cs1,String cs2) {
		return StringUtils.equalsIgnoreCase(cs1, cs2);
	}
	
	
	
	/*MAP & LIST & SET judge工具*/
	public static boolean isEmpty(Collection<?> coll) {
		return CollectionUtils.isEmpty(coll);
	}
	
	public static boolean isNotEmpty(Collection<?> coll) {
		return CollectionUtils.isNotEmpty(coll);
	}
	
	public static Collection isEmptyReturnCreate(Collection<?> coll) {
		if(CollectionUtils.isEmpty(coll))
			return Lists.newArrayList();
		return coll;
	}
	
	public static Collection isEmptyReturnNull(Collection<?> coll) {
		if(CollectionUtils.isEmpty(coll))
			return null;
		return coll;
	}
	
	
	
	/*OBJECT judge工具*/
	public static boolean isNull(Object obj) {
		return null == obj;
	}
	
	public static boolean isNotNull(Object obj) {
		return null != obj;
	}
	
	public static Object isNullReturnCreate(Object obj) {
		if(null == obj)
			return new Object();
		return obj;
	}
	
	public static Object isNullReturnNull(Object obj) {
		if(null == obj)
			return null;
		return obj;
	}
	
	public static String isObjectNullReturnNull(Object obj) {
		if(null == obj)
			return null;
		return obj.toString();
	}
	
	
	
	/*MAP工具*/
	public static String getString(Map map,String key) {
		if(null == map) {
			return StringUtils.EMPTY;
		}else {
			return map.get(key) == null ? null : map.get(key).toString();
		}
	}
	
	public static String getStr(Map map,String key) {
		if(null == map) {
			return StringUtils.EMPTY;
		}else {
			return map.get(key) == null ? StringUtils.EMPTY : map.get(key).toString();
		}
	}
	
	public static String getSpace(Map map,String key) {
		if(null == map) {
			return StringUtils.SPACE;
		}else {
			return map.get(key) == null ? StringUtils.SPACE : map.get(key).toString();
		}
	}
	
	public static int getInt(Map map, String key) {
		if (null == map) {
			return 0;
		} else if (null == map.get(key)) {
			return 0;
		} else {
			return StringUtils.EMPTY.equals(map.get(key).toString()) ? 0 : Integer.valueOf(map.get(key).toString());
		}
	}
	
}
