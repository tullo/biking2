/*
 * Copyright 2019 michael-simons.eu.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

CREATE TABLE tracks (
  id                  serial primary key,
  name                VARCHAR(512) NOT NULL,
  covered_on          DATE NOT NULL,
  description         VARCHAR(2048),
  minlat              DECIMAL(18, 15),
  minlon              DECIMAL(18, 15),
  maxlat              DECIMAL(18, 15),
  maxlon              DECIMAL(18, 15),
  type                VARCHAR(50) DEFAULT 'biking' NOT NULL,
  CONSTRAINT track_check_type CHECK(TYPE IN('biking', 'running')),
  CONSTRAINT track_unique UNIQUE(covered_on, name)
);
