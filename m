Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,1/8] dt-bindings: stm32-dma: introduce DMA features bitfield
From: Rob Herring <robh@kernel.org>
Message-Id: <20180318124930.tgd4llar3zat7idx@rob-hp-laptop>
Date: Sun, 18 Mar 2018 07:49:30 -0500
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Cc: Vinod Koul <vinod.koul@intel.com>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Dan Williams <dan.j.williams@intel.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <dmaengine.vger.kernel.org>

T24gVHVlLCBNYXIgMTMsIDIwMTggYXQgMDU6NDI6MDBQTSArMDEwMCwgUGllcnJlLVl2ZXMgTU9S
RFJFVCB3cm90ZToKPiBUaGlzIGJpdGZpZWxkIGludGVuZHMgdG8gYWRkcmVzcyBmZWF0dXJlcyB0
byBiZSBhY3RpdmF0ZWQgd2l0aGluIHRoZQo+IGRyaXZlci4gSW5pdGlhbGx5IHRoZSBtYXNrIHdh
cyBvbmx5IG1lYW50IGZvciBGSUZPIFRocmVzaG9sZCBtYW5hZ2VtZW50Lgo+IEJhY2t3YXJkIGNv
bXBhdGliaWxpdHkgaXMgcHJlc2VydmVkIGJ1dCB0aGUgbWVhbmluZyBvZiB0aGlzIGZpZWxkIGhh
cyBiZWVuCj4gZXh0ZW5kZWQgdG8gZmVhdHVyZXMgaW5zdGVhZCBvZiBvbmx5IHRocmVzaG9sZC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBQaWVycmUtWXZlcyBNT1JEUkVUIDxwaWVycmUteXZlcy5tb3Jk
cmV0QHN0LmNvbT4KPiAtLS0KPiAgIFZlcnNpb24gaGlzdG9yeToKPiAgICAgdjE6Cj4gICAgICAg
ICogSW5pdGlhbAo+IC0tLQo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZG1hL3N0bTMyLWRtYS50eHQgfCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+Ci0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUg
bGluZSAidW5zdWJzY3JpYmUgZG1hZW5naW5lIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8g
bWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8v
dmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK
