Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] dmaengine: qcom_hidma: assign channel cookie correctly
From: Yang Shunyong <shunyong.yang@hxt-semitech.com>
Message-Id: <e3a2d37d7bce44eb8d3a726a8f69c8d7@HXTBJIDCEMVIW02.hxtcorp.net>
Date: Wed, 9 Jan 2019 07:51:11 +0000
To: Vinod Koul <vkoul@kernel.org>
Cc: "andy.gross@linaro.org" <andy.gross@linaro.org>, "david.brown@linaro.org" <david.brown@linaro.org>, Sinan Kaya <okaya@kernel.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zheng, Joey" <yu.zheng@hxt-semitech.com>
List-ID: <dmaengine.vger.kernel.org>

SGksIFZpbm9kLAogIFRoYW5rcyBmb3IgeW91ciBpbmZvcm1hdGlvbi4gSSB3aWxsIGNoZWNrIHdp
dGggb3VyIElULgpTaHVueW9uZy4KVGhhbmtzLgoKT24gMjAxOS8xLzkgMTU6MDAsIFZpbm9kIEtv
dWwgd3JvdGU6Cj4gT24gMDktMDEtMTksIDAxOjM1LCBZYW5nLCBTaHVueW9uZyB3cm90ZToKPj4g
SGksIFZpbm9kIGFuZCBBbGwsCj4+ICAgSSBmb3VuZCwgc29tdGltZXMsIEkgY2Fubm90IHJlY2Vp
dmVkIHNvbWUgbWFpbHMgZnJvbSB0aGlzIG1haWxpbmcKPj4gbGlzdC4gRm9yIGV4YW1wbGUsIEkg
c2VudCBteSB2MiBzZXJpZXMgb24gN3RoLCBKYW4sCj4+Cj4+IGh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcHJvamVjdC9saW51eC1kbWFlbmdpbmUvbGlzdC8/c2VyaWVzPTYyNzEzCj4+Cj4+
IEl0IGFwcGVhcmVkIG9uIHBhdGNod29yay5rZXJuZWwub3JnIGJ1dCBJIGhhdmVuJ3QgcmVjZWl2
ZWQgaXQgaW4gdGhpcwo+PiBtYWlsaW5nIGxpc3QuCj4+Cj4+IEFuZCBJIGZvdW5kIHJhbmRvbWx5
LCBhIG1vbnRoIG9yIHR3byBtb250aHMsIEkgYW0gdW5zdWJzY3JpYmVkIGZyb20gdGhpcwo+PiBs
aXN0IGF1dG9tYXRpY2FsbHkuIFRoZW4gSSBoYXZlIHRvIHJlLXN1YnNjcmliZSB0aGUgbGlzdC4K
PiAKPiBJIGd1ZXNzIHlvdXIgY29ycG9yYXRlIHNlcnZlciBpcyB0byBibGFtZS4gdmdlciBtYWls
IGxpc3QgaXMgImtub3ciIHRvIAo+IHVuc3Vic2NyaWJlIHNlcnZlcnMgd2hpY2ggYmVoYXZlIGJh
ZGx5LCBzbyB5b3UgbmVlZCB0byBhc2sgeW91ciBtYWlsCj4gYWRtaW5zIHdoeSBhbmQgdHJ5IHRv
IHVzZSBvdGhlciBlbWFpbCB3aGljaCBpcyBrbm93biB0byBiZSBmcmllbmRseSB3aXRoCj4gdmdl
ciA6KQo+IAo+PiBIYXZlIHNvbWVvbmUgbWV0IHNpbWlsYXIgcHJvYmxlbSBhcyBtZT8gT3IgbWF5
YmUgSSBtaXNzZWQgc29tZSBuZWNlc3NhcnkKPj4gc2V0dGluZ3M/Cj4+Cj4+IFNodW55b25nLgo+
PiBUaGFua3MuCj4K
