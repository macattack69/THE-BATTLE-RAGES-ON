shader_type canvas_item;

uniform float blur_radius : hint_range(0, 20) = 5.0;

void fragment() {
    vec4 blurred_color = vec4(0.0);

    for (int x = -5; x <= 5; x++) {
        for (int y = -5; y <= 5; y++) {
            vec2 offset = vec2(0, 0) * blur_radius * 0.01;
            blurred_color += texture(TEXTURE, UV + offset);
        }
    }

    COLOR = blurred_color / 121.0;  // Number of samples in the blur kernel
}
