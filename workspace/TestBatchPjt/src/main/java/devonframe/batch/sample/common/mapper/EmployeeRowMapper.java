/*
 * Copyright 2006-2007 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package devonframe.batch.sample.common.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import devonframe.batch.sample.common.model.Employee;

public class EmployeeRowMapper implements RowMapper<Object> {

	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {        
		
		Employee emp = new Employee();
		emp.setNum(rs.getString("num"));
		emp.setName(rs.getString("name"));
		emp.setSex(rs.getString("sex"));
		emp.setDepartmentCode(rs.getString("department_code"));
		emp.setJoblevelCode(rs.getString("joblevel_code"));
		emp.setSkillCode(rs.getString("skill_code"));
		emp.setTelephone(rs.getString("telephone"));
		emp.setBirthdate(rs.getString("birthdate"));
		emp.setPostal(rs.getString("postal"));
		emp.setAddress(rs.getString("address"));

        return emp;
	}

}
