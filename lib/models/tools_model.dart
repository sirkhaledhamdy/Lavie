class ToolsModel {
  String? type;
  String? message;
  List<ToolsData>? data;

  ToolsModel({this.type, this.message, this.data});

  ToolsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ToolsData>[];
      json['data'].forEach((v) {
        data!.add(new ToolsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ToolsData {
  String? toolId;
  String? name;
  String? description;
  String? imageUrl;

  ToolsData({this.toolId, this.name, this.description, this.imageUrl});

  ToolsData.fromJson(Map<String, dynamic> json) {
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['toolId'] = this.toolId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
