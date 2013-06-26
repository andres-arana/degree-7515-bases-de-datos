
class Generate {

  public static void main(String[] argv) {
    for (int i = 0; i < 126/3; i++) {
      System.out.println("INSERT INTO jockey(persona_dni, categoria, talla, peso) VALUES ("+(10000001+(3*i))+", \"Profesional\", "+String.valueOf((((Math.random()*20)+150)/100)).substring(0,4)+", "+String.valueOf(50+Math.random()*10).substring(0,4)+");");
    }
    for (int i = 0; i < 126/3; i++) {
      System.out.println("INSERT INTO entrenador(persona_dni) VALUES ("+(10000002+(3*i))+");");
    }
    for (int i = 0; i < 126/3; i++) {
      System.out.println("INSERT INTO cuidador(persona_dni) VALUES ("+(10000003+(3*i))+");");
    }

    for (int i = 0; i < 126/3; i++) {
      System.out.println("INSERT INTO equino(nombre, tipo, pelaje, sexo, handicap, stud_nombre, padre_nombre, madre_nombre, cuidador_persona_dni, entrenador_persona_dni) VALUES (?, ?, ?, ?, ?, ?, ?, ?, "+(10000003+(3*i))+", "+(10000002+(3*i))+");");
    }
  }
}
