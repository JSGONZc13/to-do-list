class ModeloEvaluacion {
  final int? id;
  final String? nombre;
  final String? descripcion;
  final bool? vigencia;

  ModeloEvaluacion({
    this.id,
    required this.nombre,
    required this.descripcion,
    this.vigencia,
  });

  factory ModeloEvaluacion.fromJson(Map<String, dynamic> json) {
    return ModeloEvaluacion(
      id: json['me_pk_id'],
      nombre: json['me_nombre'],
      descripcion: json['me_descripcion'],
      vigencia: json['me_vigencia'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'me_pk_id': id,
      'me_nombre': nombre,
      'me_descripcion': descripcion,
      'me_vigencia': vigencia,
    };
  }
}
