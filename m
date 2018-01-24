Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: dmaengine: dmatest: fix container_of member in dmatest_callback
From: Adam Wallis <awallis@codeaurora.org>
Message-Id: <ba859f5a-905f-a980-847d-66b7454f01db@codeaurora.org>
Date: Wed, 24 Jan 2018 13:34:39 -0500
To: "Yang, Shunyong" <shunyong.yang@hxt-semitech.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>
Cc: "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zheng, Joey" <yu.zheng@hxt-semitech.com>, "okaya@codeaurora.org" <okaya@codeaurora.org>, "graham.moore@linux.intel.com" <graham.moore@linux.intel.com>
List-ID: <dmaengine.vger.kernel.org>

Vmlub2QsCgpPbiAxLzIzLzIwMTggODo0NyBQTSwgWWFuZywgU2h1bnlvbmcgd3JvdGU6Cj4gSGks
IEFkYW0KPiAKPiBPbiBUdWUsIDIwMTgtMDEtMjMgYXQgMDk6MzIgLTA1MDAsIEFkYW0gV2FsbGlz
IHdyb3RlOgo+PiBPbiAxLzIyLzIwMTggMjoyOCBBTSwgWWFuZyBTaHVueW9uZyB3cm90ZToKPj4+
Cj4+PiBUaGUgdHlwZSBvZiBhcmcgcGFzc2VkIHRvIGRtYXRlc3RfY2FsbGJhY2sgaXMgc3RydWN0
IGRtYXRlc3RfZG9uZS4KPj4+IEl0IHJlZmVycyB0byB0ZXN0X2RvbmUgaW4gc3RydWN0IGRtYXRl
c3RfdGhyZWFkLCBub3QgZG9uZV93YWl0Lgo+Pj4KPj4+IEZpeGVzOiA2ZjZhMjNhMjEzYmUgKCJk
bWFlbmdpbmU6IGRtYXRlc3Q6IG1vdmUgY2FsbGJhY2sgd2FpdCAuLi4iKQo+Pj4gU2lnbmVkLW9m
Zi1ieTogWWFuZyBTaHVueW9uZyA8c2h1bnlvbmcueWFuZ0BoeHQtc2VtaXRlY2guY29tPgpbLi5d
Cj4+Pgo+PiBUaGFua3MgZm9yIHRoZSBjYXRjaAo+Pgo+PiBBY2tlZC1ieTogQWRhbSBXYWxsaXMg
PGF3YWxsaXNAY29kZWF1cm9yYS5vcmc+Cj4gCj4gVGhhbmtzIQo+IAo+IFNodW55b25nCj4gCgpD
YW4gd2UgZ2V0IHRoaXMgZml4IGludG8gdGhlIDQuMTYga2VybmVsPyBUaGlzIGlzIGFuIGltcG9y
dGFudCBmaXguCgpUaGFua3MKCkFkYW0K
