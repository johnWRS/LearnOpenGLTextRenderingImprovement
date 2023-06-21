#version 330 core
layout (location = 0) in vec2 vertex; // <vec2 pos>

out VS_OUT{
    vec2 TexCoords;
    flat int index;
}vs_out;

uniform mat4 transforms[400];
uniform mat4 projection;

void main()
{
    gl_Position = projection *transforms[gl_InstanceID]* vec4(vertex.xy, 0.0, 1.0);
    vs_out.index=gl_InstanceID;
    vs_out.TexCoords = vertex.xy;
    vs_out.TexCoords.y=1.0f-vs_out.TexCoords.y;
}