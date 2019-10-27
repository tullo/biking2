/*
 * Copyright 2014-2019 michael-simons.eu.
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
package ac.simons.biking2.trips;

import ac.simons.biking2.support.TestConfig;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

/**
 * @author Michael J. Simons
 *
 * @since 2014-02-16
 */
@SpringBootTest(classes = TestConfig.class)
@ActiveProfiles("test")
class AssortedTripRepositoryTest {

    @Autowired
    private AssortedTripRepository assortedTripRepository;

    @Test
    void testGetTotalDistance() {
        Assertions.assertEquals(43.8, this.assortedTripRepository.getTotalDistance().doubleValue());
    }

    @Test
    void testGetTotalDistanceInYear() {
        Assertions.assertEquals(21.9, this.assortedTripRepository.getTotalDistanceInYear(2013).doubleValue());
    }
}
