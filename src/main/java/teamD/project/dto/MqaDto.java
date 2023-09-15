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
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder

public class MqaDto {
	
	private long idx;
	private String writer;
	private String title;
	private String content;
	private int readCount;
	private Timestamp createdAt;
	private String commentCount;

}
