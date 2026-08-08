#version 450

/*
    Permission to use, copy, modify, and/or distribute this software for any
    purpose with or without fee is hereby granted.

    THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
    REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
    AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
    INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
    LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
    OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
    PERFORMANCE OF THIS SOFTWARE.
*/

layout(push_constant) uniform Push
{
    mat4 MVP;
    vec4 SourceSize;
    vec4 OriginalSize;
    vec4 OutputSize;
    uint FrameCount;
} global;

layout(std140, set = 0, binding = 0) uniform UBO
{
    float PS_VERTICAL_INTERVAL;
    float PS_HORIZONTAL_INTERVAL;
    float PS_ADAPTIVE_MODE;
} params;

#pragma parameter PS_VERTICAL_INTERVAL "Vertical Shift Interval Frames x 60 (0: Disabled)" 300.0 0.0 3600.0 1.0
#pragma parameter PS_HORIZONTAL_INTERVAL "Horizonal Shift Interval Frames x 60 (0: Disabled)" 150.0 0.0 3600.0 1.0
#pragma parameter PS_ADAPTIVE_MODE "Disable Vertical Shift on High-Res Content" 0.0 0.0 1.0 1.0

#define VERTICAL_STEP 0.5
#define HORIZONTAL_STEP 1.0
#define FRAME_FACTOR 60u
#define HIRES_CUTOFF 288.5

uint vert_single = uint(params.PS_VERTICAL_INTERVAL) * FRAME_FACTOR;
#define vert_double (2u * vert_single)
#define vert_triple (3u * vert_single)
#define vert_quadruple (4u * vert_single)

uint hor_single = uint(params.PS_HORIZONTAL_INTERVAL) * FRAME_FACTOR;
#define hor_double (2u * hor_single)
#define hor_triple (3u * hor_single)

#pragma stage vertex
layout(location = 0) in vec4 Position;
layout(location = 1) in vec2 TexCoord;
layout(location = 0) out vec2 vTexCoord;

void main()
{
    gl_Position = global.MVP * Position;
    
    float vert_offset = 0.0;
    float hor_offset = 0.0;
    
    if (params.PS_VERTICAL_INTERVAL > 0.5 && (params.PS_ADAPTIVE_MODE < 0.5 || global.OriginalSize.y < HIRES_CUTOFF))
    {
        uint vert_frames = global.FrameCount % vert_quadruple;
        
        if (vert_frames >= vert_triple)
            vert_offset = VERTICAL_STEP * global.OriginalSize.w;
        else if (vert_frames >= vert_single && vert_frames < vert_double)
            vert_offset = -VERTICAL_STEP * global.OriginalSize.w;
    }
    
    if (params.PS_HORIZONTAL_INTERVAL > 0.5)
    {
        uint hor_frames = global.FrameCount % hor_triple;
        
        if (hor_frames >= hor_double)
            hor_offset = HORIZONTAL_STEP * global.OutputSize.z;
        else if (hor_frames < hor_single)
            hor_offset = -HORIZONTAL_STEP * global.OutputSize.z;
    }
    
    vTexCoord = TexCoord - vec2(hor_offset, vert_offset);
}

#pragma stage fragment
layout(location = 0) in vec2 vTexCoord;
layout(location = 0) out vec4 FragColor;
layout(set = 0, binding = 2) uniform sampler2D Source;

void main()
{
    FragColor = texture(Source, vTexCoord);
}
