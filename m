Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,2/2] dmaengine: stm32-mdma: Fix incomplete Hw descriptors allocator
From: Vinod Koul <vinod.koul@intel.com>
Message-Id: <20180413040233.GJ6014@localhost>
Date: Fri, 13 Apr 2018 09:32:33 +0530
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Dan Williams <dan.j.williams@intel.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gV2VkLCBBcHIgMTEsIDIwMTggYXQgMDQ6NDQ6MzlQTSArMDIwMCwgUGllcnJlLVl2ZXMgTU9S
RFJFVCB3cm90ZToKCj4gIHN0cnVjdCBzdG0zMl9tZG1hX2Rlc2Mgewo+ICAJc3RydWN0IHZpcnRf
ZG1hX2Rlc2MgdmRlc2M7Cj4gIAl1MzIgY2NyOwo+IC0Jc3RydWN0IHN0bTMyX21kbWFfaHdkZXNj
ICpod2Rlc2M7Cj4gLQlkbWFfYWRkcl90IGh3ZGVzY19waHlzOwo+ICAJYm9vbCBjeWNsaWM7Cj4g
IAl1MzIgY291bnQ7Cj4gKwlzdHJ1Y3Qgc3RtMzJfbWRtYV9kZXNjX25vZGUgbm9kZVtdOwoKc29t
ZSBwcGwgdXNlIG5vZGVbMF0gZm9yIHRoaXMgYnV0IGkgdGhpbmsgZWl0aGVyIGlzIGZpbmUuLgoK
PiAgc3RhdGljIHZvaWQgc3RtMzJfbWRtYV9kdW1wX2h3ZGVzYyhzdHJ1Y3Qgc3RtMzJfbWRtYV9j
aGFuICpjaGFuLAo+IC0JCQkJICAgc3RydWN0IHN0bTMyX21kbWFfaHdkZXNjICpod2Rlc2MpCj4g
KwkJCQkgICBzdHJ1Y3Qgc3RtMzJfbWRtYV9kZXNjX25vZGUgKm5vZGUpCj4gIHsKPiAtCWRldl9k
YmcoY2hhbjJkZXYoY2hhbiksICJDVENSOiAgICAweCUwOHhcbiIsIGh3ZGVzYy0+Y3Rjcik7Cgo+
ICsJZGV2X2RiZyhjaGFuMmRldihjaGFuKSwgIkNUQ1I6ICAgIDB4JTA4eFxuIiwgbm9kZS0+aHdk
ZXNjLT5jdGNyKTsKCnRoaXMgaXMgbm9pc2UgZm9yIHRoaXMgcGF0Y2ggYW5kIElJVUMgeW91IHNo
b3VsZCBiZSBhYmxlIHRvIHBhc3MKbm9kZS0+aHdkZXNjIGFuZCBrZWVwIGZuIHNhbWU/Cg==
