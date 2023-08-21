package helper;

import java.util.List;

import com.abc.model.Education;
import com.abc.model.Experience;
import com.abc.model.Jobs;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Profile {
	private Long id;
	private String firstName;
	private String lastName;
	private String fullName;
	private String email;
	private String city;
	private String phoneNumber;
	
	private List<Experience> ex;
	private List<Education> ed;

	private List<Jobs> jb;


	public List<Experience> getEx() {
		return ex;
	}
	public void setEx(List<Experience> ex) {
		this.ex = ex;
	}
	public List<Education> getEd() {
		return ed;
	}
	public void setEd(List<Education> ed) {
		this.ed = ed;
	}

	public List<Jobs> getJb(){
		return jb;
	}
	public void setJb(List<Jobs> jb){
		this.jb = jb;
	}
	
	
	
}
