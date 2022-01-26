/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

<#assign package="" />
<#if feature?split(",")?size gt 1>
    <#assign package="mixed" />
<#else>
    <#assign package = feature?replace('-', '.') />
</#if>
package org.apache.shardingsphere.example.${package}.${framework?replace('-', '.')}.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.shardingsphere.example.${package}.${framework?replace('-', '.')}.entity.OrderItem;

import java.util.List;

@Mapper
public interface OrderItemRepository {
    
    void createTableIfNotExists();
    
    void truncateTable();
    
    void dropTable();

<#if feature?contains("shadow")>
    void createTableIfNotExistsShadow();
    
    void truncateTableShadow();
    
    void dropTableShadow();
</#if>
    
    void insert(OrderItem orderItem);
    
    void delete(long orderId);
    
    List<OrderItem> selectAll();
}
