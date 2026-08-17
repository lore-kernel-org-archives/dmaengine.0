Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011001.outbound.protection.outlook.com [40.107.74.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B800361DDA
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 20:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786996914; cv=fail; b=HwbIeye4drwzQh8jH8MfQCT5IEsC1838S/yAkZx9enJ28pG0E/gSo0XOaUGzp/J+bC0FNd/upQGFiCDXzQZqkYbEb5Z1qwksRdg1+yUyz0T53LqdW4kkoO/aiz04680Fq5NqDdiZqVVU9RzMfXdakv2hAZBfoLkcO1pDSB/qO3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786996914; c=relaxed/simple;
	bh=GGQzI/m+Ide0LIhhBcMXhy25DSXEoYosccCnw203dbY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bwUCnlBx2ihCntoK8SWJtXHKG5MsdW6sFclWSQilvs+8iGXcdolcbdLosSSPiGGAjuOfvkFjjzcLuGjxlhwDC2twBb+TR1Q/3fA0V76foDNNosNhgLiWEOoe9Ou5sl9Ji6/b+Wridd0f19Jjv536aqv981MGp9iD7g+3bSVUCAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZJHgGKKY; arc=fail smtp.client-ip=40.107.74.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZJHgGKKY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqwVeEWCxo9mQ97xPelJkTxGmCB1LvZ+c7IV8W0ZkpHUItyWKjaumFc+vNQjc6VcCFNGQeF/uFn/WJy99c/sVcPghisSZvHbBfKynY140QE+Ovx8+LTnaGJo4wLEFs3fhCtR1/A1AYO9hsN7HZtstKO56NNxzprcqvx4PyEcqbbAfpkACh2vEDVv6bzZMZeicC/ME8UMnbmoD8/zJcdrwrU+qqv882AhDBt0SOcJQ+TmWRKSBojGRWgchXo00Jle5BD6HV5wb8tdLfl584t2rCvlbHijoeQ+ajnjHem6+1mAtKFBa9HLbNdrnUgCijgDY7o4qXGvWx5HhxRfpliZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGQzI/m+Ide0LIhhBcMXhy25DSXEoYosccCnw203dbY=;
 b=kMqfHApcybXuaf8vid5D/mYuxieMFo2sqAr5FQ3duicRj0A/rqFK2HGKNu9HL2JSalAAzr6MGA21j2Ec6JCy/5opEyJXBQUEEiUTKx7jJIQFv206tX0R9sQa0PjoYGJKGXkZ9XexolVCLvPUtJSyCjmdElYQYgOOeI+eEkjNv6yzHsn4/vG9lvEadUd2oo7okhl5S/dfAm+UtFMf61V3R/1F21wGgrkRXG8v7UV4+HTGBh0KOp6Z53wf5Ju5dAg+KxHKJu3ZAC/B7xtL8+7lyFhHv9ZGFWck7PMOXtaAL0VGOWBMm660pG0e8D6wSxAlot08wKkVUmXdu4baDu99yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGQzI/m+Ide0LIhhBcMXhy25DSXEoYosccCnw203dbY=;
 b=ZJHgGKKYI1eWHBRYRET2aAZHYDLJ2BbrdZmTuil6q+J4MnbcCK1TJyFiHgW/gLRlqJ08IgG9/NXFAykYpJv4kp+sHGOvCLtwOfa3nsyUsuvS2muYUUbaCK7llt6iHDbq8K4zB5iEztmxPA8qP9Mu2vA3oeTPPJ8vsiD/DDeMHDM=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by OS7PR01MB14905.jpnprd01.prod.outlook.com
 (2603:1096:604:39a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 20:01:48 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4%3]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 20:01:41 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "vkoul@kernel.org" <vkoul@kernel.org>, "dmaengine@vger.kernel.org"
	<dmaengine@vger.kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>
Subject: RE: [PATCH] dmaengine: dmatest: fix race between wait for thread and
 thread start
Thread-Topic: [PATCH] dmaengine: dmatest: fix race between wait for thread and
 thread start
Thread-Index: AQHdLn5iLIbTfmTNQEWURJglIiYuu7aio40AgAAFkTA=
Date: Mon, 17 Aug 2026 20:01:41 +0000
Message-ID:
 <TYRPR01MB15619B561E389CCBE0F6CCB9285A72@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20260817192557.437474-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260817194034.C27C41F000E9@smtp.kernel.org>
In-Reply-To: <20260817194034.C27C41F000E9@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|OS7PR01MB14905:EE_
x-ms-office365-filtering-correlation-id: c9afbb6c-859c-45d0-febc-08defc9a5ac6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|6133799003|38070700021|18002099003|22082099003|56012099006|10067099003|4143699003|11063799006;
x-microsoft-antispam-message-info:
 Ttl3uywHMyiV7NYeCR4pcViCQ6p8vOEETLteInrG/pC1y31amKf/I6DYBpTTpZZIc74SQHNvtdUAPuoh/dhkvOoI9FY77OmqtzzstPUEHmsXJsl2mkcD5HliHUVRzE5J+QmzVTTyauEQwI5lfPXvYx4nKxMFeoMrcM0RSG0OOkKu479YY7ATftVsaa1AGey6Re0gT2UZQeomDs7tjU3y1ag+L4QyB8wAkAWcgVOMRVPno9uF6kaO4c/YmfJ733p5eppZ+LX23cZGq7dlaq4hbsMZdv8mx98aRYPMqXbUGyqxgMv5mZde+9Jq4PnFpoml+jmnn2nDvFdi+LJujBQ+6XcgG+Tg1G9Ug5KZCfmM5O0InmDw3BQCtmIVXJ4OsmnBQqe3g97TiqOv3NAqPi3TGSpBXypLicAL8PubpYjn56N99YPgmDSETxMRsr88+YQbteQNq6JhB3BFZQD6boit4DW6hqiiU6diaK2sVOiI6KZIT2BSWN4cqbWCei4Pr0Xfbb2ydTcabPXEUGKaylADOihSJ3fU00BFNItwInQyOwme2yu/McdJXrupzuBp/XjyWSUwreWzLuh5VFVcdNRSuq3UKLiyL4SbM115x53CUpazi7zF8uLfjx/xqAbq27O7ETLwjt9jWNieuxLEEnxmbSFnsfDfEUwjXcuo8zavW/I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(38070700021)(18002099003)(22082099003)(56012099006)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M3k0U29nb1JSaWQxVUFwRlp3QUtPZW92aDdBZmVSZTk3ZTR2cDhjbFkzMEk2?=
 =?utf-8?B?clArQ0dBaHBYSEpTUjliSlpkeUo3UmplR1RKN2JSYjRoT0hmUnZwcWNqZHJV?=
 =?utf-8?B?YlpxRnhGQzN0ajBsRkNZb2ZESGRkMk1qL25XcDFlbFpRT2hhRyszTEFKUFdO?=
 =?utf-8?B?ZENvYkt2c1pUNExSVlIydnp0TDhiL3k4ZlYrRFBtQWZNMCtLN2VsbmZ0eDVE?=
 =?utf-8?B?YWRmeVhCcHNadXc1bFFiK1RBeUZVSk9McjZlYmlVTTY5dHBmRHZ5VlZFZWYy?=
 =?utf-8?B?czNlci92WHg2YlIzeHIxcWVKcEhYQ0NnaHhuRmk0R3Nxd2dmMnBFZGE4R1Za?=
 =?utf-8?B?SkRQMjBWS0kxNit1RUJSam9kcmoxc21SdFF0N2NkMTdaOVc3OXhGUWN0bHVa?=
 =?utf-8?B?V1F1UXFzUFhHaEZQbFN5eTZoL1ZpSjFtZ1YrRWJWK3ZWV09wUXFMR3JYa3lj?=
 =?utf-8?B?QVk3SHlzU3B1T3J5K3YxdldSQ0pRdnd1Y0dNSUhVdnRjeHdNNHdWbDljNFlZ?=
 =?utf-8?B?UzZBN3Nid25xVGc2TGo0d2M5YWtId2tlVm9nelVMMVQvSXViV0FvU0V3VTVj?=
 =?utf-8?B?UHA0SDlBc2t3a0k0ZkdTUlllSDc0eFVKaGJkQlVEcndDTmFQZ0lzMDRLYlRy?=
 =?utf-8?B?SVRYWURxWjRuaUNoZlhyNjNvd3dybjVVQ3k5UHNjWS9tYStPN1J1bU5MYTd1?=
 =?utf-8?B?MjNmdVYvRlArdEpTODRoMjdyczB5Wm5sejNxbVdFL2RQQlY5cnJkWlh0L09D?=
 =?utf-8?B?Qk9Zc3dRWWhPcC9ueXBOMHN6MWlDOElBZFB5MVo1eDVDajg5aWFxaFEyYnoz?=
 =?utf-8?B?RTdmN3l0NWJiRGttVlQvTjJBWHU3SDJ5SndoY3FmaEZlRjR1ZFBoMVVNc3dS?=
 =?utf-8?B?L09Icm51cTVLYTJMQlYvaE1zbVlPNHhVK3FVelFRaXVWLzZWTFh3VlV5a3Ny?=
 =?utf-8?B?WlZlL1E5cGMza2h6dE5nbnlPbDNTRi82Z0xJOWpOU3pJZjUyWS96VUdheTJs?=
 =?utf-8?B?a2NCQktPSWdldHdDK2docVdEdytESXViT3ZScm90NFROTlhLUzA3MEl3aXhr?=
 =?utf-8?B?LzJtcUFEdXJHWW1qRmhCRVFyTHF0QStkaGpraFFNbjJIeGgrVloyZUxNQ0tW?=
 =?utf-8?B?MU9QT3QxNGpSU0NGMkloc2hkeUlnbjNQeEwxc1RKMkJJYnNKWTJNbWxwMzJ3?=
 =?utf-8?B?aGhHdGVaK2tOMmI0VFY1TWR0TkpGTjNYNWhQcnZvY3ZYRTdNQnFDZ1lkN1B3?=
 =?utf-8?B?WXFxZWVNNml0MmtFUWJ0bmphQ05jTmdwb3ZpdnAyakl3ZEEvdVF4Y0Nvc3pO?=
 =?utf-8?B?UWo2ME16RGpmWkFCcTRUdm1FdHM5RTAwRVVhMTQ1K2p2aHBPeDhxOW1MdEtp?=
 =?utf-8?B?ZEMrZ1NiNFFKc0RZWEkzdUIyVmxrLytuQzdMcDRCUnpISU9Tbmx0WkhRSFlZ?=
 =?utf-8?B?U2xrK2pveU1vaDRXbTc3R0Qyazg4MDBzZGlvd05JMXdVcjc1SEpvQkIxeHNl?=
 =?utf-8?B?bk5iTnNrSythYkFPd09kN0krYVk4Vll5TXBYUEpidTIzcUV6em9xUVNPb3BZ?=
 =?utf-8?B?VlhESlI4WUg1b0crcURYLzRTWnFtUVhqQTNuRHhaTUtpUDdEelQ5SEYxZWh0?=
 =?utf-8?B?aldubHBkN3VKaDNmM09pdyt4SnN2YnRuZlpxelh2aDBXcnRnYjhtbDQ4TEtG?=
 =?utf-8?B?dDdKVElndmZmLzNYdlRoeURXTnYrUVArVW5NN20yOFhNK0hwb2cxVXNZY0VN?=
 =?utf-8?B?TTlNWFBCdVh2SFNOem9VNXV2RWtmaEFkUm9mcWFZVnlaNk9vRThKaFo5RzEz?=
 =?utf-8?B?dzlFQVMrSDh0dktJSmdyNXk1d1MzRlZRa0o4Z2M5UlZrUjZzZnNLeGs1SCt1?=
 =?utf-8?B?dmdGZEx6MXZWam5tSGlMVUFQZlYxR0JWTFdwTHM5UExYSmVCTG12c3U5RWFv?=
 =?utf-8?B?V21MZ3JSM3Nvb21YK0dacGNqT1NKU3czOVZWWUszU1dtei9yMzJIV2Q3RXFh?=
 =?utf-8?B?bVF2eHE0dnZiRTNnQmdOUkw2NVB5UytnQnZmbVRHSE4reUpEOWhML25walpR?=
 =?utf-8?B?WUV3aHhGcnF0d1E5N0c4NC90RUJRMjNIM0t3eVdMZ1o2VEVSRVRsSGJXV0lz?=
 =?utf-8?B?TEljSUdobnVyaitYZzJzNlh6aHgwVytiL3ZNV0lTNisxcnFiUVVJNVM0bllx?=
 =?utf-8?B?eTB1WEk0T2U3WXo5OWV6U0Izd2xxdWJaUVlPamwrS0ljRElwZjlMV2lDR0Mz?=
 =?utf-8?B?SElyeVRYQkxNRzYxWDN5MWNzQmtCMXdjUTlVN1JwYWVPNThHdlNZRyttYk0v?=
 =?utf-8?B?N3JQbU1FNTF4L3liWFpYd1l0ZktldCtiU0tqS3duZzJZR0ZxUUR1aGtpRW5M?=
 =?utf-8?Q?DSwH9Y/CC0zeViMT+RShdAedJjI0PxIyZnz6j?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB15619.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9afbb6c-859c-45d0-febc-08defc9a5ac6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2026 20:01:41.1123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vj3PxAWM/Es1n0bMToYlOEeIXE626LeXaEkXSkIihiVmU0VgaqHxWcx3j6SHMe9kvdOnjLEl3jvvpvEx6i+S933Yq0clI3q5Hp7nEu0klwKthvRCMNQ6g20PY7oTV/B0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14905

PiBGcm9tOiBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0K
PiBTZW50OiBNb25kYXksIEF1Z3VzdCAxNywgMjAyNiAxMDo0MSBQTQ0KPiANCj4gVGhhbmsgeW91
IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMiBwb3RlbnRp
YWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+IA0KPiBOZXcgaXNzdWVzOg0KPiAtIFtNZWRpdW1d
IFRPQ1RPVSByYWNlIGluIHBlbmRpbmcgZmxhZyB1cGRhdGUgYWxsb3dzIHByZW1hdHVyZSB3YWl0
IGNvbXBsZXRpb24uDQo+IA0KPiBQcmUtZXhpc3RpbmcgaXNzdWVzOg0KPiAtIFtIaWdoXSBMb2Nr
bGVzcyBsaXN0IHRyYXZlcnNhbCBpbiB3YWl0IGNvbmRpdGlvbiBjYXVzZXMgVXNlLUFmdGVyLUZy
ZWUga2VybmVsIGNyYXNoLg0KPiAtLQ0KPiANCj4gLS0tIFBhdGNoIFsxXTogW1BBVENIXSBkbWFl
bmdpbmU6IGRtYXRlc3Q6IGZpeCByYWNlIGJldHdlZW4gd2FpdCBmb3IgdGhyZWFkIGFuZCB0aHJl
YWQgc3RhcnQgLS0tDQo+IGNvbW1pdCA2YTVlOGYyNGRkYjRiOWU0NzFkMTgwMWQ1OGYyYzkxYjA3
ZjgzZDEzDQo+IEF1dGhvcjogQ29zbWluIFRhbmlzbGF2IDxjb3NtaW4tZ2FicmllbC50YW5pc2xh
di54YUByZW5lc2FzLmNvbT4NCj4gDQo+IGRtYWVuZ2luZTogZG1hdGVzdDogZml4IHJhY2UgYmV0
d2VlbiB3YWl0IGZvciB0aHJlYWQgYW5kIHRocmVhZCBzdGFydA0KPiANCj4gVGhpcyBjb21taXQg
YWRkcmVzc2VzIGEgcmFjZSBjb25kaXRpb24gaW4gdGhlIGRtYXRlc3QgbW9kdWxlIHdoZXJlIHRo
ZSB3YWl0DQo+IG1vZHVsZSBwYXJhbWV0ZXIgY291bGQgY2F1c2UgYW4gZWFybHkgZXhpdCBpZiB0
aGUgd29ya2VyIHRocmVhZCBoYXMgbm90IHlldA0KPiBzdGFydGVkLiBJdCBhdHRlbXB0cyB0byBy
ZXNvbHZlIHRoaXMgYnkgY2xlYXJpbmcgdGhlIHBlbmRpbmcgZmxhZyBpbW1lZGlhdGVseQ0KPiBh
ZnRlciB3YWtpbmcgdXAgdGhlIHdvcmtlciB0aHJlYWQuDQo+IA0KPiA+IFdoZW4gdGhlIHdhaXQg
bW9kdWxlIHBhcmFtZXRlciBpcyBzZXQgdG8gdHJ1ZSwgZG1hdGVzdF9pbml0KCkgd2FpdHMgZm9y
DQo+ID4gdGhlICFpc190aHJlYWRlZF90ZXN0X3J1bigpIGNvbmRpdGlvbiB0byBiZWNvbWUgdHJ1
ZS4NCj4gDQo+IFtTZXZlcml0eTogSGlnaF0NCj4gVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1
ZSwgYnV0IGRvZXMgZXZhbHVhdGluZyB0aGlzIGNvbmRpdGlvbiByZXBlYXRlZGx5DQo+IGluIHdh
aXRfZXZlbnQoKSB3aXRob3V0IGhvbGRpbmcgYSBsb2NrIGxlYWQgdG8gYSB1c2UtYWZ0ZXItZnJl
ZT8NCj4gDQo+IExvb2tpbmcgYXQgaXNfdGhyZWFkZWRfdGVzdF9ydW4oKSwgaXQgaXRlcmF0ZXMg
b3ZlciBpbmZvLT5jaGFubmVscyBhbmQNCj4gZHRjLT50aHJlYWRzIHdpdGhvdXQgaG9sZGluZyBp
bmZvLT5sb2NrOg0KPiANCj4gZHJpdmVycy9kbWEvZG1hdGVzdC5jOmlzX3RocmVhZGVkX3Rlc3Rf
cnVuKCkgew0KPiAgICAgLi4uDQo+ICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KGR0YywgJmluZm8t
PmNoYW5uZWxzLCBub2RlKSB7DQo+ICAgICAgICAgLi4uDQo+ICAgICB9DQo+ICAgICAuLi4NCj4g
fQ0KPiANCj4gSWYgc3RvcF90aHJlYWRlZF90ZXN0KCkgaXMgZXhlY3V0ZWQgY29uY3VycmVudGx5
IHZpYSBzeXNmcywgaXQgY2FuIG1vZGlmeQ0KPiB0aGUgbGlzdCBub2Rlcy4gU2luY2UgdGhlIHRy
YXZlcnNhbCBpbiBpc190aHJlYWRlZF90ZXN0X3J1bigpIGhhcHBlbnMNCj4gd2l0aG91dCBob2xk
aW5nIHRoZSBsb2NrLCBjb3VsZCB0aGlzIGhpdCBmcmVlZCBtZW1vcnkgYW5kIHJlc3VsdCBpbiBh
DQo+IGRpcmVjdCB1c2UtYWZ0ZXItZnJlZT8NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
ZG1hL2RtYXRlc3QuYyBiL2RyaXZlcnMvZG1hL2RtYXRlc3QuYw0KPiA+IGluZGV4IDJhZTM0Njkz
OTdmMzcuLjJkMmViNDNlZWU3Y2MgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9kbWEvZG1hdGVz
dC5jDQo+ID4gKysrIGIvZHJpdmVycy9kbWEvZG1hdGVzdC5jDQo+IFsgLi4uIF0NCj4gPiBAQCAt
MTE0Miw2ICsxMTQxLDcgQEAgc3RhdGljIHZvaWQgcnVuX3BlbmRpbmdfdGVzdHMoc3RydWN0IGRt
YXRlc3RfaW5mbyAqaW5mbykNCj4gPiAgICAgICAgICAgICAgIHRocmVhZF9jb3VudCA9IDA7DQo+
ID4gICAgICAgICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KHRocmVhZCwgJmR0Yy0+dGhyZWFk
cywgbm9kZSkgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICB3YWtlX3VwX3Byb2Nlc3ModGhy
ZWFkLT50YXNrKTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgdGhyZWFkLT5wZW5kaW5nID0g
ZmFsc2U7DQo+IA0KPiBbU2V2ZXJpdHk6IE1lZGl1bV0NCj4gQ291bGQgdGhpcyBvcmRlciBvZiBv
cGVyYXRpb25zIGludHJvZHVjZSBhIHJhY2Ugd2luZG93Pw0KPiANCj4gSWYgd2FrZV91cF9wcm9j
ZXNzKCkgbWFrZXMgdGhlIHRocmVhZCBydW5uYWJsZSBpbW1lZGlhdGVseSwgY291bGQgYQ0KPiBj
b25jdXJyZW50IHdhaXRfZXZlbnQoKSBldmFsdWF0ZSBhIHN0YWxlIHBlbmRpbmcgc3RhdGUgYmVm
b3JlIGl0IGlzDQo+IGNsZWFyZWQgaGVyZT8NCj4gDQo+IFdvdWxkIHN3YXBwaW5nIHRoZXNlIG9w
ZXJhdGlvbnMgdG8gY2xlYXIgdGhlIHBlbmRpbmcgZmxhZyBzdHJpY3RseSBiZWZvcmUNCj4gdGhl
IHdha2V1cCBwcmV2ZW50IGNvbmN1cnJlbnQgd2FpdF9ldmVudCgpIGV2YWx1YXRpb25zIGZyb20g
ZXhpdGluZw0KPiBwcmVtYXR1cmVseT8NCj4gDQoNCkkgZGlkbid0IGhpdCB0aGlzIHJhY2UgZHVy
aW5nIHRlc3RpbmcgYnV0IFNhc2hpa28ncyBzdWdnZXN0aW9uIHNvdW5kcw0KY29ycmVjdC4gSSB3
aWxsIHJlLXRlc3Qgd2l0aCBpdCBhbmQgc3VibWl0IFYyLg0KDQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgIHRocmVhZF9jb3VudCsrOw0KPiA+ICAgICAgICAgICAgICAgfQ0KPiA+ICAgICAgICAg
ICAgICAgcHJfaW5mbygiU3RhcnRlZCAldSB0aHJlYWRzIHVzaW5nICVzXG4iLA0KPiANCj4gLS0N
Cj4gU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIw
MjYwODE3MTkyNTU3LjQzNzQ3NC0xLWNvc21pbi0NCj4gZ2FicmllbC50YW5pc2xhdi54YUByZW5l
c2FzLmNvbT9wYXJ0PTENCg==
