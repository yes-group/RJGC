function msgcheak(msg) {
	switch(msg.code) {
		case "0":
			return true;
			break;
		case "1":
			alert(msg.msg);
			return false;
			break;
		case "2":
			window.location.href = msg.msg;
			return true;
			break;
		case "3":
			window.location.href = msg.msg;
			return false;
			break;
		case "4":
			var strs=msg.msg.split("|");
			alert(strs[1]);
			window.location.href = strs[0];
			return false;
			break;
		default:
			return false;
			break;
	}
}