package teamD.project.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@Builder
@NoArgsConstructor
@ToString

public class MuserDto {
	private String id;
	private String Password;
	private String Name;
	private String nickname;
	private Date birth;
	private String Address;
	private String phone;

}
