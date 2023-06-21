#version 330 core
out vec4 color;

in VS_OUT{
    vec2 TexCoords;
    flat int index;
}fs_in;

uniform sampler2DArray text;
uniform int letterMap[400];
uniform vec3 textColor;

void main()
{    
    vec4 sampled = vec4(1.0, 1.0, 1.0, texture(text, vec3(fs_in.TexCoords.xy,letterMap[fs_in.index])).r);
    color = vec4(textColor, 1.0) * sampled;
}