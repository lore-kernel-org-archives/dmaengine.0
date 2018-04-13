Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,2/2] dmaengine: stm32-mdma: Fix incomplete Hw descriptors allocator
From: Vinod Koul <vinod.koul@intel.com>
Message-Id: <20180413100921.GM6014@localhost>
Date: Fri, 13 Apr 2018 15:39:22 +0530
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dmaengine@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-ID: <dmaengine.vger.kernel.org>

T24gRnJpLCBBcHIgMTMsIDIwMTggYXQgMTA6Mzk6NDhBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEhpIFZpbm9kLAo+IAo+IE9uIEZyaSwgQXByIDEzLCAyMDE4IGF0IDY6MDIg
QU0sIFZpbm9kIEtvdWwgPHZpbm9kLmtvdWxAaW50ZWwuY29tPiB3cm90ZToKPiA+IE9uIFdlZCwg
QXByIDExLCAyMDE4IGF0IDA0OjQ0OjM5UE0gKzAyMDAsIFBpZXJyZS1ZdmVzIE1PUkRSRVQgd3Jv
dGU6Cj4gPgo+ID4+ICBzdHJ1Y3Qgc3RtMzJfbWRtYV9kZXNjIHsKPiA+PiAgICAgICBzdHJ1Y3Qg
dmlydF9kbWFfZGVzYyB2ZGVzYzsKPiA+PiAgICAgICB1MzIgY2NyOwo+ID4+IC0gICAgIHN0cnVj
dCBzdG0zMl9tZG1hX2h3ZGVzYyAqaHdkZXNjOwo+ID4+IC0gICAgIGRtYV9hZGRyX3QgaHdkZXNj
X3BoeXM7Cj4gPj4gICAgICAgYm9vbCBjeWNsaWM7Cj4gPj4gICAgICAgdTMyIGNvdW50Owo+ID4+
ICsgICAgIHN0cnVjdCBzdG0zMl9tZG1hX2Rlc2Nfbm9kZSBub2RlW107Cj4gPgo+ID4gc29tZSBw
cGwgdXNlIG5vZGVbMF0gZm9yIHRoaXMgYnV0IGkgdGhpbmsgZWl0aGVyIGlzIGZpbmUuLgo+IAo+
IG5vZGVbXSBpcyB0aGUgY29ycmVjdCBvbmUsIG5vZGVbMF0gbWF5IGhpZGUgZnV0dXJlIGJ1Z3Ms
IGNmci4gY29tbWl0Cj4gYTE1ODUzMWYzYzkyNDY3ZCAoImdwaW86IDc0eDE2NDogRml4IGNyYXNo
IGR1cmluZyAucmVtb3ZlKCkiKQoKWWVhaCBidXQgaXQgdGhpcyBjYXNlIGl0IGlzIHRoZSBsYXN0
IGVsZW1lbnQuIEJ1dCB5ZXMgaXQgaGVscHMgdG8gYXZvaWQgc3VjaAptaXN0YWtlcyBpbiBmdXR1
cmUuLgo=
