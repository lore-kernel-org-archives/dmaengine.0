Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010002.outbound.protection.outlook.com [52.103.43.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3AB3A6B8E
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 22:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787178477; cv=fail; b=RQAxcQLH65Cqd1sSigeaPOg1SaLiDdFiGcDWWJQz2WCjBBj4KEytiaoZOcvmOO8dBmSHkdiV+Nu4S0Pc6y1UQbgVEhwsOLELWkpNhsrzsnIgKrNrM8ovrsujR+XK/6RWxwclZR34dCX8A74FzhsJDFvKrffiwhr2Ual6QrWr33Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787178477; c=relaxed/simple;
	bh=xIhyg+lAqtQwq2Tp2IW4+Jmmnx60PibJZUAbYPulkbQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PeIWN7ml+qeXegccrXLsR+7Uamk/Raj9YFcc+uK2PNFtbJs+FhpT9o6lFd7wszXgO9zazwQn0kWtpz9jFyyyR0OygShlO/XUd5OkcBpi4N2zhox44uZNPyKcxlREMV5GTStqz7CuP9yQ51XzGSYpC+0tJiU0BZYSTBflj7/FbyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ih1Hfob7; arc=fail smtp.client-ip=52.103.43.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ih1Hfob7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foKrc6o3h0n7u2Nbor80YL5J+TFFmCY9EUxAmjmK2pgtjsYzK48lW8KVIbalP/u+TNcy37+A4543kvV/LOoSHIXbyHJgdgbZyEgZszsp4TyJ4tJ3pHfa4IetAyntMIpkSH8sg3io3Grs/vycrnJdWZ5FqqCYJ1jnamHLQlM2hIqhFZfZRggoGvlh4frJzCF5gQKH0cCLmaQdCiQpUA7zTLZlgTp9bX/wd6P1Gxs7ICsWYeT2paLg06jHxhTcw31kZ1QVOfBGbK6adb6fKLsWKzHiyflilCjqcpraZom7W4trR+ZdKGJga70wtF2/Pc/O4GaZTZguMJ6WutNpbDv1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIhyg+lAqtQwq2Tp2IW4+Jmmnx60PibJZUAbYPulkbQ=;
 b=Hi4gjsAQ0+Cr7UI9JkgnukZLo/EFw1P1r9cdm7li86CvlkLRxiIFUdomfQM16jZpVz15d5K97SHwpZF2fq0QxzS3wgLeiU4C5f6ji+6lEWxKWwTOCYQqBCuVR4D/XMatMT7IR3c1oRb/0Jajrv0Vhazjcu1Meb5mdZVt1hjZtFD2JsjKeMVbltJtYJkq45eai4922xKdAS42IOiojMTX1Q2oLuPqaW/Ekm9XZXB1p/ksRQxZvu82WvqgqE02ApG+D4gtj0bDzFF2i/ubO0vymfo2jyre/8xaWS93Xng/B/Zp3vZinbGHaBchO8eKTx6YCxzTSGL0aC3L2vt+Bpzsog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIhyg+lAqtQwq2Tp2IW4+Jmmnx60PibJZUAbYPulkbQ=;
 b=ih1Hfob7Xzyas51Cj+XJllq65L9wfxc7R6bfnZC1hEMp48Y5Qe1O6QNnfMs+BZ+hfB/7t06ds2zeTpWpN4B7fXp77w4U7eObny8Nx7f4ZUZff5lzODtFoyYRjhAoetkALH9KgOk1t6yJfQ6PR2UYxHZc80IwJqeU1PjUBUe6QbHTPs6PCCrCAVk5mayMFksuBi0KkAzYYuOHJO9P7jD7qilUyAJyoJ6DLYqOvpW+GyhruRADm7tqfS9JTQ/lpu14vZTZzRh+pek2rvBl98pl9xL32WXT9Jg9X1vf098jzbbOPX4p8AbSR8+/f+nb+TUji3+SmVH7fPBp/CDhOaySYQ==
Received: from TY4PR01MB15735.jpnprd01.prod.outlook.com
 (2603:1096:405:28d::12) by OSRPR01MB11490.jpnprd01.prod.outlook.com
 (2603:1096:604:22d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 22:27:53 +0000
Received: from TY4PR01MB15735.jpnprd01.prod.outlook.com
 ([fe80::629b:bf8d:87d4:d3f3]) by TY4PR01MB15735.jpnprd01.prod.outlook.com
 ([fe80::629b:bf8d:87d4:d3f3%5]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 22:27:53 +0000
From: =?gb2312?B?1cUgxP4=?= <zhangn1985@outlook.com>
To: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>
Subject: Issue report DMA:PL330 Runtime PM usage count underflow!
Thread-Topic: Issue report DMA:PL330 Runtime PM usage count underflow!
Thread-Index: AQHdMCmHZRxH3xVpokWnZ6zOxvO1og==
Date: Wed, 19 Aug 2026 22:27:53 +0000
Message-ID:
 <TY4PR01MB1573500CED2A1A3A8884B5F30CDA52@TY4PR01MB15735.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB15735:EE_|OSRPR01MB11490:EE_
x-ms-office365-filtering-correlation-id: 88cca2d3-465e-41c7-783a-08defe411c30
x-microsoft-antispam:
 BCL:0;ARA:14566002|4140399003|25010399006|19110799012|31061999003|8062599012|25031999004|8060799015|24021099003|15080799012|15030799006|16041099003|3412199025|440099028|102099032|53005399003|40105399003|2607281247196008;
x-microsoft-antispam-message-info:
 =?gb2312?B?MmxrZlI3dFpNWmZZYmVIaVp1WERtcDNKdXJXWFBWcUFCRk5GOXJNY1Fnc3Zr?=
 =?gb2312?B?YWJQeGh2QUY2dDBJZzJQTFVuaXdhZU9lRVN3VkpPcmdETWRyaWJzdkd6dTJH?=
 =?gb2312?B?WkVIckVRYnhSWnNPQTNJUzhRbTV1TXRib3VPQm9uQVBQeW1ndnJBQ1JkbUU5?=
 =?gb2312?B?akZTVUdNcW1HYms0Snl2b0JpczJ3SmIrQWxlOEs3MUN5djdoTWVzVDI4bUxl?=
 =?gb2312?B?MlNnT1VnT2RpMitCTHE0b3JrMHZzZVl2TXM3eWxWR2hmR0hiZkFMdCtUaTN1?=
 =?gb2312?B?YWtHUiszaEZFWmhyNG5jdnRpYzVrMkwySlZYMktJcE95dGQvNmNRN25rQWxR?=
 =?gb2312?B?aG1wd0NFb1E1Vm5vcHZIN1JEYlF0WDNzSHZaYWxnTHExb01xT2o3Wk4xS1Zv?=
 =?gb2312?B?Zy9iUUROQlc2YUluTHAwZVVieWNvTHZ5VTNsbWJEWUlnd0tCYUwzQ2xvTk84?=
 =?gb2312?B?ZW1vdE50MXN2cXMyNW9leDArUG5JWUY2dXB2VmxxaFV3UExGcEhKUmQzeitu?=
 =?gb2312?B?MC9YQTRBNVZXRUJMWmwwU2xyb1JFaVBkamRsdlB4VjlWbkxrVEF4bHlzemUr?=
 =?gb2312?B?Wk1XM0JvbFRUY0V5NUhrNjNES1VTa1F1aStNMmZncmVrUFY4dVhNSTdVYlNV?=
 =?gb2312?B?S21tRXJGUmN2cWxkL0s4aitQYncrWVJhdmExbjIyVUIxckJNNEVISVFFY1FU?=
 =?gb2312?B?VGlHYjRYcUp1d0psWm9VSGV5R2YwejBlcmtuTkNMUGdHd1JDNS9PWEhMRTBx?=
 =?gb2312?B?blBLekJDRDBVSy83NGZlaWZQa0tIc29RRDFJRURTMytVcGExRVlGWDh6N000?=
 =?gb2312?B?L1BsTWc2N1lqOTlZUHRDUlkzN3NGdHE1a3JBdlJrRkt0UTUrajh4NXpXTUZi?=
 =?gb2312?B?bkZuaWgxR3kveVM0ZG9SU29HWk84VWdzRlloL0ZSV3pzTGFZdWZjN0F1bVph?=
 =?gb2312?B?UjY4amt2czBWK0J2Ykd0Nk13ekhnWXhhNWx0WCtBL1pmVlNkakZONHRWazYr?=
 =?gb2312?B?SWdRZitrZkZxdituQnVyY2hqV3JJRnhCNGozTGd1aUFEREtPMXRGVHVtUXdT?=
 =?gb2312?B?MmJ4K2xJVk42V0pyeVBKYURiSW1GR1J0T2t0a0tHOEFONTBDeEl3UlJQV2Qv?=
 =?gb2312?B?NXNBZEhVTjRKMzFkZnpxRWJYaE14SGlVdjdWQkFLdWFoSThndkg3RzAzZFRX?=
 =?gb2312?B?Wit4ZXQzdVNxeWVGcnJWS3d5cWZGSkJxQUEyZ1ZiM21tRGw2eFJLeWhmcWRO?=
 =?gb2312?B?MGhuRTlvMmozUGFSZEgyK29keTZTRjRnVmg4aElGOVEwUkkvWWFtTWRiL0ZT?=
 =?gb2312?B?dkwwU21nckE2Y2xPVlZBR1F2WE5MSlZ5Z0MyWEJqUHU2TDRTUTRtNDV5L2RJ?=
 =?gb2312?Q?Bc9jc8dJBHMHM7xKFpnTRjhNuoBOkqnE=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?MmU4OXBvczRSbm5WbEE5WmdIdUp0RFZ0RGdGenlqak43VG1LYWkzaXJuZjNL?=
 =?gb2312?B?Z25NZmFCaFVQNkNJaFVCdGE1RUNrNzdraWNsS3czK0xWcHhCOEFyY0ErOTlH?=
 =?gb2312?B?Z1dndzd1eC94REM5RXZrVGRxSWpyUjNWdnFyNE90dFF5Z0YzM0hqem52NllH?=
 =?gb2312?B?djhFOTRsdHZicHVJVXRJeFpSNDc4aTNXWTNaSnlWa04wV0tmRUt2K1J3L1Ji?=
 =?gb2312?B?V3lqSWRyeTRkSGV0eWdOM0FKQTMyT1l1a0pJZ3BjVXNFVmlJSEtnTkR0Q1Rh?=
 =?gb2312?B?cDZVVlpycm9nRlVIVXUrZlpmdlZhYkhMeThYalRjbEYrMjhZbjgvdUZmQURB?=
 =?gb2312?B?MDNEODdwSkt5U2l4TUpjU0ZkbGxFMk11dzJweDFNenNzM3lMQ0FNUlNielEy?=
 =?gb2312?B?RytEUXp3ZmVYTVluQmRaVmJ4NFRMRGlyWUdMWHljRm10UHBrQ3lydDhtcW55?=
 =?gb2312?B?YjVaQ1dEMDRkZGdHeFV5eUlucTVtamJhMFg1Wm42ekJya3hETmExdzlzR0Z0?=
 =?gb2312?B?d3pERkV4cmo2eC93dkFuTDRRZU1QSU8ycUMxWnlOa3JoTmh3SHc5SDIxOWJh?=
 =?gb2312?B?Z0o0cWpmL0piL1kyazF2bVlBcEkwS01iMk5iQXZQeFA4anZFNWhHTkg3RnRi?=
 =?gb2312?B?VVBBSkYxM1FiM2huZTdMYnpJaCtJT3plN2pTQkRHMGVvUTc4YkF0TWpIWm9B?=
 =?gb2312?B?STdoTVlzVkhqM2dNRHFBRXRKeldZZ2d6Rkh2WXhCL3VBUkhMNklWOEJmYlpL?=
 =?gb2312?B?MzAveG5lUWV1OG5TdXhncS82emtJY0tieHVOc1lHUnl2SC9QWG5rdUZTQi82?=
 =?gb2312?B?eUx6ektXK1llMmNvZEdnellVRGJrNkF6cStrM09Fa0RURjE1cnVmMVVya3hk?=
 =?gb2312?B?UW5xbkVwWUF2Szhxb204b2QwYzJhS2RyTTRpNU50YWV4RGQ1OWxBSzVaVW9Z?=
 =?gb2312?B?YWN6UEF5ZkFZckVwTFBFdW9OSEJLN3UxM3NDMlRjcllrT2FhYmU3TE9xcC8r?=
 =?gb2312?B?TWJuZmQyMThMeitCRW93WDFpSmhGV2N1ak5ZL2ZwVW1MN0JURTF3bTAyTWg3?=
 =?gb2312?B?UjNzbjN5UnFWY25pMk1ITDhTMDRyQUUwemZ3dy9UcllZRkpwN2dKNFdaTG1C?=
 =?gb2312?B?cENoZXVhbzZwZGo5MnB1dk1qV3RnVkhLZUpmd1l6TVkyR1dnS2dSTExqcUYv?=
 =?gb2312?B?VDNtb0xvNVhYUVZodHVZWGMvK1pQdkhPNEI5Mnl1RDd6THdOT2hlRGY3ZGtw?=
 =?gb2312?B?cUhZbkNQb0h1MXhqZDZYTm5EUjZ4S2E4LzNOMTdiRkpyZm52ZkVINlJBY0pm?=
 =?gb2312?B?SmtWRnAyY3U2ZFcxRSs3MGo2STUyc0ZVWCtVck9nTnR4aHhHTnBqVkYwNlFj?=
 =?gb2312?B?SVByV25zMjh0WFNuMysrVmVmNkEvd2R0S0dxdk01elBTOW9IdStPb1JSVHV2?=
 =?gb2312?B?bkN2QWhmRFh2enprTDMwQkF6cngvcDBXbFhTbzEreXh3UW44M3FhS2svVUt1?=
 =?gb2312?B?Z0JqZ0poWTFucVhmalFjR0RFZFVxWFoybGl1blY5WTNMOGVobUpsRmhVVThV?=
 =?gb2312?B?NGNLanVaeldpdUo4L3hrYW50Z096NWtyTXhyUEhCNWJjdGN6VWR2WVNPM284?=
 =?gb2312?B?aUJPdG1TNzhjREtoOHE0SEtyaEcxeWlteWpxMVNVNUphaFRIWW0zbENoNzZ1?=
 =?gb2312?B?Q1VBdHFoWThFakVPUXNSdE5EbVNhcUlsY2I0djVCSUd2ZWo2TkRLT3grQU9a?=
 =?gb2312?B?akdGNXBua0tTY2xnODROMmpWa3pMeS9Cb0lWQlJUai9OTGcrZmVEUjF6WTMr?=
 =?gb2312?Q?ZHqxuV2nJso0ufoFmz5fPF2EoMpgESyJYPlxA=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB15735.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 88cca2d3-465e-41c7-783a-08defe411c30
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 22:27:53.2179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11490

RGVhciBtYWludGFpbmVycwoKSSBmaW5kIHRoZSBrZXJuZWwgbG9nOgoKYGBgClsxMjMyNzQuODUx
NDAxXSBkbWEtcGwzMzAgZmYyNTAwMDAuZG1hLWNvbnRyb2xsZXI6IFJ1bnRpbWUgUE0gdXNhZ2Ug
Y291bnQgdW5kZXJmbG93IQpbMTIzNDIxLjg3NTg2MV0gZG1hLXBsMzMwIGZmMjUwMDAwLmRtYS1j
b250cm9sbGVyOiBSdW50aW1lIFBNIHVzYWdlIGNvdW50IHVuZGVyZmxvdyEKWzEyNDI1MS44ODk5
NjhdIGRtYS1wbDMzMCBmZjI1MDAwMC5kbWEtY29udHJvbGxlcjogUnVudGltZSBQTSB1c2FnZSBj
b3VudCB1bmRlcmZsb3chCmBgYAoKc2luY2UgNi4xOC5YLiAKClRvZGF5IEkgaGF2ZSB0aW1lIHRv
IHJlYWQgY29kZSwgYW5kIGZpbmQgdGhlIGNvZGU6CgpgYGAKcGwzMzBfdGVybWluYXRlX2FsbAou
Li4KICAgICAgICBsaXN0X3NwbGljZV90YWlsX2luaXQoJnBjaC0+Y29tcGxldGVkX2xpc3QsICZw
bDMzMC0+ZGVzY19wb29sKTsKICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZwY2gtPmxv
Y2ssIGZsYWdzKTsKICAgICAgICBpZiAocG93ZXJfZG93bikKICAgICAgICAgICAgICAgIHBtX3J1
bnRpbWVfcHV0X2F1dG9zdXNwZW5kKHBsMzMwLT5kZG1hLmRldik7CiAgICAgICAgcG1fcnVudGlt
ZV9wdXRfYXV0b3N1c3BlbmQocGwzMzAtPmRkbWEuZGV2KTsKYGBgCgp0aGVyZSBhcmUgMiBwbV9y
dW50aW1lX3B1dCwgSSB0aGluayB0aGlzIGlzIHdoeSB1bmRlcmZsb3cuCgpJIGRvbid0IGtub3cg
aG93IHRvIGZpeCBpdC4gdGh1cyByZXBvcnQgYW4gaXNzdWUuCgpJIHRyaWVkIHJlbW92ZSB0aGUg
c2Vjb25kIGBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZGAsIGFuZCBhbmQgaWRsZSBvdmVybmln
aHQsIHRoZSBsb2cgaXMgZ29uZS4KCkJSLgpOaW5nLg==
