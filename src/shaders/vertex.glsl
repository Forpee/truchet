varying vec2 vUv;
varying vec3 vPosition;
varying vec3 vNormal;

void main()
{
    // vec4 mvPosition=modelViewMatrix*vec4(position,1.);
    // gl_PointSize=100.*(1./-mvPosition.z);
    vUv=uv;
    vPosition=position;
    vNormal=normal;
    
    vec3 newPos=position;
    
    newPos+=.27*normal*(4.*vUv.x-.03);
    
    gl_Position=projectionMatrix*modelViewMatrix*vec4(newPos,1.);
    
}