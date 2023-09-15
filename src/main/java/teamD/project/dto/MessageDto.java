package teamD.project.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class MessageDto {
	
	private long m_idx;
	private String sendid; 
	private String reciveid; 
	private String message; 
	private Timestamp m_date; 
	private int status;

}
