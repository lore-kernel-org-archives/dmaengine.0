Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,1/1] dmaengine: stm32-dmamux: fix a potential buffer overflow
From: Vinod Koul <vinod.koul@intel.com>
Message-Id: <20180322052150.GB15443@localhost>
Date: Thu, 22 Mar 2018 10:51:50 +0530
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Dan Williams <dan.j.williams@intel.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gVHVlLCBNYXIgMTMsIDIwMTggYXQgMDU6NTU6MzVQTSArMDEwMCwgUGllcnJlLVl2ZXMgTU9S
RFJFVCB3cm90ZToKPiBUaGUgYml0ZmllbGQgZG1hX2ludXNlIGlzIGFsbG9jYXRlZCBvZiBzaXpl
IGRtYV9yZXF1ZXN0cyBiaXRzLCB0aHVzIGEKPiB2YWxpZCBiaXQgYWRkcmVzcyBpcyBmcm9tIDAg
dG8gKGRtYV9yZXF1ZXN0cyAtIDEpLgo+IFdoZW4gZmluZF9maXJzdF96ZXJvX2JpdCgpIGZhaWxz
LCBpdCByZXR1cm5zIGRtYV9yZXF1ZXN0cyBhcyBpbnZhbGlkCj4gYWRkcmVzcy4KPiBVc2luZyBz
dWNoIGFkZHJlc3MgZm9yIHRoZSBmb2xsb3dpbmcgc2V0X2JpdCgpIGlzIGluY29ycmVjdCBhbmQs
IGlmCj4gZG1hX3JlcXVlc3RzIGlzIGEgbXVsdGlwbGUgb2YgQklUU19QRVJfTE9ORywgaXQgd2ls
bCBjYXVzZSBhIGJ1ZmZlcgo+IG92ZXJmbG93Lgo+IEN1cnJlbnRseSB0aGlzIGRyaXZlciBpcyBv
bmx5IHVzZWQgaW4gRFQgc3RtMzJoNzQzLmR0c2kgd2hlcmUgYSBzYWZlIHZhbHVlCj4gZG1hX3Jl
cXVlc3RzPTE2IGlzIG5vdCB0cmlnZ2VyaW5nIHRoZSBidWZmZXIgb3ZlcmZsb3cuCj4gCj4gRml4
ZWQgYnkgY2hlY2tpbmcgdGhlIHJldHVybiB2YWx1ZSBvZiBmaW5kX2ZpcnN0X3plcm9fYml0KCkg
X2JlZm9yZV8KPiB1c2luZyBpdC4KCkFwcGxpZWQsIHRoYW5rcwo=
