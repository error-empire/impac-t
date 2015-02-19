/*

    Copyright (c) 2015 Oliver Lau <ola@ct.de>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

*/

uniform sampler2D uTexture;
uniform vec2 uResolution;
uniform float uScale;

const int NUM = 9;

vec2 c[NUM] = {
  vec2(-1.0, 1.0), vec2(0.0,  1.0), vec2(1.0, 1.0),
  vec2(-1.0, 0.0), vec2(0.0,  0.0), vec2(1.0, 0.0),
  vec2(-1.0,-1.0), vec2(0.0, -1.0), vec2(1.0,-1.0)
};

float w[NUM] = {
  -1.0, -1.0, -1.0,
  -1.0,  8.0, -1.0,
  -1.0, -1.0, -1.0
};


void main()
{
  const vec2 Center = vec2(0.5);
  vec2 pos = gl_TexCoord[0].st;

  vec3 color[NUM];
  for (int i = 0; i < NUM; ++i) {
    color[i] = texture2D(uTexture, pos + c[i] / uResolution).rgb;
  }
  vec3 c = vec4(0.0);
  for (int i = 0; i < NUM; ++i) {
    c += color[i] * w[i];
  }
  gl_FragColor = vec4(c, 1.0);
}