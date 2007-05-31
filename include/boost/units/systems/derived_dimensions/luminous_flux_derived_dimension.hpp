// mcs::units - A C++ library for zero-overhead dimensional analysis and 
// unit/quantity manipulation and conversion
//
// Copyright (C) 2003-2007 Matthias Christian Schabel
// Copyright (C) 2007 Steven Watanabe
//
// Distributed under the Boost Software License, Version 1.0. (See
// accompanying file LICENSE_1_0.txt or copy at
// http://www.boost.org/LICENSE_1_0.txt)

#ifndef BOOST_UNITS_LUMINOUS_FLUX_DERIVED_DIMENSION_HPP
#define BOOST_UNITS_LUMINOUS_FLUX_DERIVED_DIMENSION_HPP

#include <boost/units/derived_dimension.hpp>
#include <boost/units/systems/base_dimensions/luminous_intensity_base_dimension.hpp>
#include <boost/units/systems/base_dimensions/solid_angle_base_dimension.hpp>

namespace boost {

namespace units {

/// derived dimension for luminous flux : I QS
typedef derived_dimension<luminous_intensity_base_dimension,1,solid_angle_base_dimension,1>::type   luminous_flux_dim;

} // namespace units

} // namespace boost

#endif // BOOST_UNITS_LUMINOUS_FLUX_DERIVED_DIMENSION_HPP
