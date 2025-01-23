class MovementUtils {
  static bool isRotatingLeft(bool isTappingLeft) => isTappingLeft == true;
  static bool isRotatingRight(bool isTappingRight) => isTappingRight == true;
  static bool isClutching(bool isTappingClutch) => isTappingClutch == true;
  static bool isStationary(bool isTappingClutch) => isTappingClutch == false;
}
