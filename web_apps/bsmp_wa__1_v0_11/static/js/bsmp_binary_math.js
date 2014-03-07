"use strict";

/*
 * Copyright (c) 2013, 2014 Joseph J. Simpson
 * This file is part of the bsmp_wa_1 program, this program will have multiple versions.
 * This file in bsmp_wa_1 is free software: you can redistribute ist and/or modify
 * it under the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later version.
 *
 * The bsmp_wa_1 program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
 * PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along with bsmp_wa_1.
 * If not, see <http://www.gnu.org/licenses/>
 */

var BSMP = {
  limit: 1e-5,
  notice: "Special binary matrix and vector type.",
  reference: "Societal Systems: Planning, Policy, and Complexity, 1976 - J. Warfield."
}; 

BSMP.VecBin = function() {};

BSMP.VecBin.new_one = function(ele) {
  var Vb = new BSMP.VecBin();
  return Vb.setElements(ele);
};

var $Vb = BSMP.VecBin.new_one;
 
BSMP.VecBin.O = function(n) {
  var ele = [];
  for(i=0; i<n; i++)
  { 
  	 ele.push(0);
  }
  return BSMP.Vector.new_one(ele);
};
 
BSMP.VecBin.l = function(n) {
  var ele = [];
  for(i=0; i<n; i++)
  { 
  	 ele.push(1);
  }
  
  return BSMP.VecBin.new_one(ele);
}; 

 BSMP.VecBin.prototype = {
  e: function(i) {
    return (i < 1 || i > this.elements.length) ? null : this.elements[i-1];
  },
   
   setE: function(x, y) {
    if(x < 1|| x > this.elements.length) { 
    	alert ("Element out of range, please enter valid element.");
    } else {
    	this.elements[x-1] = y;		
    }
  }, 
  
  indexOf: function(x) {
    var index = null; 
    var n = this.elements.length;
    for (var i = 0; i < n; i++) {
      if (index === null && this.elements[i] == x) { 
        index = i + 1;
      }
    }
    return index;
  },
  
   view: function() {
    return '[' + this.elements.join(', ') + ']';
  },

 
 setElements: function(els) {
    this.elements = (els.elements || els).slice();
    return this;
  } 
};

BSMP.MatrixBin = function() {};

BSMP.MatrixBin.new_one = function(els) {
  var MB = new BSMP.MatrixBin();
  return MB.setElements(els);
};
var $Mb = BSMP.MatrixBin.new_one;

BSMP.MatrixBin.Id = function(n) {
  var els = []; 
  var i;
  var j;
  for(i = 0; i < n; i++) {
    els[i] = [];
  for(j = 0; j < n; j++) {
      els[i][j] = (i === j) ? 1 : 0;
    }
  }
  return BSMP.MatrixBin.new_one(els);
};
 

 
 BSMP.MatrixBin.O = function(a) {
  var els = []; 
  var i;
  var j;
  for(i = 0; i < a; i++) {
    els[i] = [];
  for(j = 0; j < a; j++) {
      els[i][j] = 0;
    }
  }
  return BSMP.MatrixBin.new_one(els);
};
 
 
 
 BSMP.MatrixBin.prototype = {
  e: function(i,j) {
    if (i < 1 || i > this.elements.length || j < 1 || j > this.elements[0].length) { 
    	alert ("Matrix element, to return, is out of range, please enter valid element cell.");
    	return null; 
    }
    return this.elements[i-1][j-1];
  },
  
  setE: function(i,j, v) {
    if (i < 1|| i > this.elements.length || j < 1 || j > this.elements[0].length) { 
    	alert ("Matrix element, to set, is out of range, please enter valid element cell.");
    } else {
    	this.elements[i-1][j-1] = v;	
    }
    
  },

  row: function(i) {
    if (i < 1 || i > this.elements.length) {
    	alert ("Matrix row, to return, is out of range, please enter valid row.");
     	return null; 	
     }
    return BSMP.VecBin.new_one(this.elements[i-1]);
  },
  
  setRow: function(i, newRow) { 
  	if(this.elements.length === 0) {
  	alert ("Matrix (row) is empty. Select a matrix with content.");
  	
  	} else if ( i < 1 || i > this.elements.length) {
  		alert ("Matrix row, to replace, is out of range, please enter valid row.");
  		return null;
  	} else {
  		this.elements[i-1] = newRow.elements ;
  	}
  
  },

  col: function(j) {
    if (this.elements.length === 0) { 
    	alert ("Matrix (col) is empty. Select a matrix with content.");
    	return null; 
    }
    if (j < 1 || j > this.elements[0].length) { 
    	alert ("Matrix column, to return, is out of range, please enter valid column .");
    	return null;
    }
    var col = [], n = this.elements.length;
    for (var i = 0; i < n; i++) { col.push(this.elements[i][j-1]); }
    return BSMP.VecBin.new_one(col);
  },
  
  setCol: function(j, newColumn) {
  	var n;
	var j;
	var i;
    if (this.elements.length === 0) { 
    	alert ("Matrix column, to set, is out of range, matrix is empty. Select a matrix with content.");
    	return null; 
    }
    if (j < 1 || j > this.elements[0].length) { 
    	alert ("Matrix column, to set is out of range, please enter valid column .");
    	return null;
    }
    n = this.elements.length;
    for (var i = 0; i < n; i++) { 
    	this.elements[i][j-1] = newColumn.e(i+1);
    }
  }, 
  
  rows: function() {
    return this.elements.length;
  },

  colus: function() {
    if (this.elements.length === 0) { return 0; }
    return this.elements[0].length;
  },

  dup: function() {
    return BSMP.MatrixBin.new_one(this.elements);
  },

  map: function(fn, context) {
    if (this.elements.length === 0) { return BSMP.MatrixBin.new_one([]); }
    var els = []; 
    var i = this.elements.length; 
    var nj = this.elements[0].length; 
    var j;
    while (i--) { 
      j = nj;
      els[i] = [];
      while (j--) {
        els[i][j] = fn.call(context, this.elements[i][j], i + 1, j + 1);
      }
    }
    return BSMP.MatrixBin.new_one(els);
  },
  
  isSameSizeAs: function(matrix) {
    var M = matrix.elements || matrix;
    if (typeof(M[0][0]) === 'undefined') { M = BSMP.MatrixBin.new_one(M).elements; }
    if (this.elements.length === 0) { return M.length === 0; }
    return (this.elements.length === M.length &&
        this.elements[0].length === M[0].length);
  },
   
  add: function(matrix) {
    if (this.elements.length === 0) return this.map(function(x) { return x });
    var M = matrix.elements || matrix;
    if (typeof(M[0][0]) === 'undefined') { M = BSMP.MatrixBin.new_one(M).elements; }
    if (!this.isSameSizeAs(M)) { return null; }
    return this.map(function(x, i, j) { return x + M[i-1][j-1]; });
  },
  
   subtract: function(matrix) {
    if (this.elements.length === 0) return this.map(function(x) { return x });
    var M = matrix.elements || matrix;
    if (typeof(M[0][0]) === 'undefined') { M = BSMP.MatrixBin.new_one(M).elements; }
    if (!this.isSameSizeAs(M)) { return null; }
    return this.map(function(x, i, j) { return x - M[i-1][j-1]; });
  }, 
  
  leftMultiply: function(binary_matrix) {
    if (this.elements.length === 0) { return false; }
    var M = binary_matrix.elements || binary_matrix;
    if (typeof(M[0][0]) === 'undefined') { M = BSMP.MatrixBin.new_one(M).elements; }
    return (this.elements[0].length === M.length);
  },
  
  boolMultiply: function(binary_matrix) {
    if (this.elements.length === 0) { return null; }
    if (!binary_matrix.elements) {
      return this.map(function(x) { return x * binary_matrix; });
    }
    var returnVector = binary_matrix.modulus ? true : false;
    var M = binary_matrix.elements || binary_matrix;
    if (typeof(M[0][0]) === 'undefined') { M = BSMP.MatrixBin.new_one(M).elements; }
    if (!this.leftMultiply(M)) { return null; }
    var i = this.elements.length;
    var nj = M[0].length;
    var j;
    var cols = this.elements[0].length;
    var c;
    var elements = [];
    var sum;
    while (i--) { j = nj;
      elements[i] = [];
      while (j--) { c = cols;
        sum = 0;
        while (c--) {
          sum += this.elements[i][c] * M[c][j];
        }
        if(sum === 0) { elements[i][j] = 0;}
        if(sum !== 0) { elements[i][j] = 1;}
      }
    }
    var M = BSMP.MatrixBin.new_one(elements);
    return returnVector ? M.col(1) : M;
  },

  setElements: function(els) {
    var i;
    var j;
    var elements = els.elements || els;
    if (elements[0] && typeof(elements[0][0]) !== 'undefined') {
      i = elements.length;
      this.elements = [];
      while (i--) { 
        j = elements[i].length;
        this.elements[i] = [];
        while (j--) {
          this.elements[i][j] = elements[i][j];
        }
      }
      return this;
    }
    var n = elements.length;
    this.elements = [];
    for (i = 0; i < n; i++) {
      this.elements.push([elements[i]]);
    }
    return this;
  },
  
   view: function() {
    var matrix_rows = [];
    var n = this.elements.length;
    if (n === 0) return '[]';
    for (var i = 0; i < n; i++) {
      matrix_rows.push(BSMP.VecBin.new_one(this.elements[i]).view());
    }
    return matrix_rows.join('<br>');
  },
 
};
