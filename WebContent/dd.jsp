<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>
<head>
<title></title>
<script type="text/javascript" src="./jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#selectall").click(selectAll);
		$("#save").click(save);
		$("#del").click(del);
	});
	function selectAll() {
		var checked = $("#selectall").attr("checked");
		$(".red input:checkbox").each(function() {
			var subChecked = $(this).attr("checked");
			if (subChecked != checked)
				$(this).click();
		});
	}
	function del() {
		$(".wrap input:checked").each(function() {
			var checked = $(this).attr("checked"); // üũ�� ������ �ҷ� ���δ�.
			if (checked == true) {
				$(this).next().remove(); //span���������
				$(this).remove(); //checkbox �����
			}
		});
	}
	function save() {
		var result = "";
		$(".box:checked").each(function() {
			$("#" + $(this).val()).remove();
			// result += ','+$(this).val();  //�Ŀ� ���� �迭�� ��� �ҽÿ��� �޹ٷ� ������. ù�޸��� ¥���� ����� 
			result += ',' + $(this).val();
			//AJAX�� �Ѱ��ٶ���   
			//.get('XXX.php',{SelType:$(this).val()});
		});
		$("#aa").empty();//�ʱ�ȭ
		$("#aa").append(result);//������ �Է�
	}
</script>
</head>
<body>
	<table>
		<tr>
			<td><input type="button" value="����" id="save"></td>
		</tr>
		<tr>
			<td><input type="button" value="����" id="del"></td>
		</tr>
	</table>
	<div class="red">
		<input type="checkbox" id=selectall>��ü����
	</div>
	<div id="wrap" class="wrap">
		<div class="red">
			<input type="checkbox" name="chkbox" value="�ϳ�" class="box" /><span>�ϳ�</span>
		</div>
		<div class="red">
			<input type="checkbox" name="chkbox" value="��" class="box" /><span>��</span>
		</div>
		<div class="red">
			<input type="checkbox" name="chkbox" value="��" class="box" /><span>��</span>
		</div>
	</div>
	<div id="aa"></div>
</body>
</html>
[��ó] jquery üũ�ڽ� ��ü �����ϰ� üũ�Ȱ��� ���û����� �Ѵ�.|�ۼ��� ī�̷�

