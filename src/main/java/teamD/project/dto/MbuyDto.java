package teamD.project.dto;

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

public class MbuyDto {
	private int pcode;
	private String pname;
	private String id;
	private int requestprice;
	private String buyid;
	private String buyphone;
	private String buyaddress;
}
