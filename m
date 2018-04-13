Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,2/2] dmaengine: stm32-mdma: Fix incomplete Hw descriptors allocator
From: Geert Uytterhoeven <geert@linux-m68k.org>
Message-Id: <CAMuHMdWNyvveQ73SDrVy=EwkkO6Gd_4hmOkdstpcgzOL44a_mA@mail.gmail.com>
Date: Fri, 13 Apr 2018 10:39:48 +0200
To: Vinod Koul <vinod.koul@intel.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dmaengine@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-ID: <dmaengine.vger.kernel.org>

SGkgVmlub2QsCgpPbiBGcmksIEFwciAxMywgMjAxOCBhdCA2OjAyIEFNLCBWaW5vZCBLb3VsIDx2
aW5vZC5rb3VsQGludGVsLmNvbT4gd3JvdGU6Cj4gT24gV2VkLCBBcHIgMTEsIDIwMTggYXQgMDQ6
NDQ6MzlQTSArMDIwMCwgUGllcnJlLVl2ZXMgTU9SRFJFVCB3cm90ZToKPgo+PiAgc3RydWN0IHN0
bTMyX21kbWFfZGVzYyB7Cj4+ICAgICAgIHN0cnVjdCB2aXJ0X2RtYV9kZXNjIHZkZXNjOwo+PiAg
ICAgICB1MzIgY2NyOwo+PiAtICAgICBzdHJ1Y3Qgc3RtMzJfbWRtYV9od2Rlc2MgKmh3ZGVzYzsK
Pj4gLSAgICAgZG1hX2FkZHJfdCBod2Rlc2NfcGh5czsKPj4gICAgICAgYm9vbCBjeWNsaWM7Cj4+
ICAgICAgIHUzMiBjb3VudDsKPj4gKyAgICAgc3RydWN0IHN0bTMyX21kbWFfZGVzY19ub2RlIG5v
ZGVbXTsKPgo+IHNvbWUgcHBsIHVzZSBub2RlWzBdIGZvciB0aGlzIGJ1dCBpIHRoaW5rIGVpdGhl
ciBpcyBmaW5lLi4KCm5vZGVbXSBpcyB0aGUgY29ycmVjdCBvbmUsIG5vZGVbMF0gbWF5IGhpZGUg
ZnV0dXJlIGJ1Z3MsIGNmci4gY29tbWl0CmExNTg1MzFmM2M5MjQ2N2QgKCJncGlvOiA3NHgxNjQ6
IEZpeCBjcmFzaCBkdXJpbmcgLnJlbW92ZSgpIikKCkdye29ldGplLGVldGluZ31zLAoKICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQK
