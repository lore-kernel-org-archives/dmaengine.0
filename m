Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012062.outbound.protection.outlook.com [40.93.195.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA6638BF72
	for <dmaengine@vger.kernel.org>; Thu, 20 Aug 2026 05:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787202610; cv=fail; b=d60PCyXIRd9LUfx647I+VmuJgIqb02wMeiz413+1KzgQuuCVHjN490ZBBXCC+mF8id+SQw2gaTaTUffE06maLAZ0SK6y5c5sxkQHVHYcOxdpLoDuvpkEzBxOieX6lM4UJ7iRR11pwwB8c6n8u+kx6jCrYSAhwqqCzq3px57ZDe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787202610; c=relaxed/simple;
	bh=Z/1KrCTgzhwjm1roWPNDjW1WCCxdwyO316Kuw8mUBkQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Bz9HIf9uWaSqgoRC3LxuPMLOIx3fQh/A1tCe40FlvEnqQzyKOnUTgFZ1KC+sN1j7kPZFomJPepdi30INTVUoTKOtWqcWj/PBEUMJ9rLIUrCTFieQXaGHEVkgDvojSv4m+FU9GXqbXwx8HY6519GM8Vg+2ivrHR/yVjYXjN6eoHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pljSnPqB; arc=fail smtp.client-ip=40.93.195.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pljSnPqB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OloWusWYvXOcpxVJNfkLcpxJZRdSilR71ssz1YxpCxZBIv9g5KNApGrMcw6FmrZuTfbS8O0QdHfR33cDjDA3eXbftuVcqeQc6T/1tGk4rttSs816cxZY5APSG0Sd0XdrSoNxlA3gMcCAWci957qxbwAZPeCwNTPUDy33dUMc//CYZxMdUSpidQ5rRNn0Bd9gkGBTH9FvzMqSsOa5730KqsiFczEosDkdqX8CzrFrcsPHXM8/Lnxlu5NRRxoEhZvDzbZpMsIAL36AikBssE2wVIKtpFE7xtyu8vFJGevoV/RgTFBioi8idmBf7/YSD3CrGEf1UICIkwKhJDdVl5KdLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/1KrCTgzhwjm1roWPNDjW1WCCxdwyO316Kuw8mUBkQ=;
 b=Qe87jDvR37SAiOQtLp705P1nEAUCeD5xjkUflh6laez67vazdDNIJEnsX1MuAI2z13EUpLPcH13nw/r2DBBvS0Fg2dDE24Byv6J0QkrttF+VlPeI/46jmcoPDgLjh/llQItaNBtboOSBs5rPIzkpqL5LDvabVSvNC7+82RP1Tc2s7VwceHGEz3UWn3nCBbK9XdMIO7zTIgyQe+wK15KVd1gaOx+JtXT5HeJ5NPf597KG6AeoWtzidxzNGEKciweM3t8OhP4fbWEA5B9InF79STInCiH8OAL08pbOm88pTLEMgfZPyuoUOjWLZDdNCzRGz9jG+EjqeH0PjomCYSctAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/1KrCTgzhwjm1roWPNDjW1WCCxdwyO316Kuw8mUBkQ=;
 b=pljSnPqBXaqQwsSCs9/E6xuIRkasoynqzrI8xd3U+HLcJcqHH9PsdV0xaCH/tiwl+RgwI7BNAp3gAR4QE1R9iyKOlwXMzXCZ+Yfd8B+byOTYG1hJj3GDZuExFdNsLLfNFG2//rMN8+m4Y9WgVi6VYnzXOwjAJ+7lkOOmms+RbQk=
Received: from SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5)
 by PH7PR12MB7260.namprd12.prod.outlook.com (2603:10b6:510:208::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 05:10:05 +0000
Received: from SN7PR12MB8147.namprd12.prod.outlook.com
 ([fe80::3923:c1a4:778b:56f2]) by SN7PR12MB8147.namprd12.prod.outlook.com
 ([fe80::3923:c1a4:778b:56f2%5]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 05:10:05 +0000
From: "Neeli, Srinivas" <srinivas.neeli@amd.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "vkoul@kernel.org" <vkoul@kernel.org>, "dmaengine@vger.kernel.org"
	<dmaengine@vger.kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>
Subject: RE: [PATCH V6 1/4] dmaengine: xilinx_dma: Fix MCDMA descriptor fields
 based on DMA direction
Thread-Topic: [PATCH V6 1/4] dmaengine: xilinx_dma: Fix MCDMA descriptor
 fields based on DMA direction
Thread-Index: AQHdLzj7gIS1Q7wj6Eybqe8Q1am+z7alpxwAgAC98dA=
Date: Thu, 20 Aug 2026 05:10:05 +0000
Message-ID:
 <SN7PR12MB8147B0266ACC8801A715D24393A42@SN7PR12MB8147.namprd12.prod.outlook.com>
References: <20260818174151.1608971-1-srinivas.neeli@amd.com>
 <20260818174151.1608971-2-srinivas.neeli@amd.com>
 <20260819174719.2AFE81F00A3D@smtp.kernel.org>
In-Reply-To: <20260819174719.2AFE81F00A3D@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-20T05:07:07.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8147:EE_|PH7PR12MB7260:EE_
x-ms-office365-filtering-correlation-id: 94f645e9-1d44-4fda-100d-08defe794c38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 VUv/ZMP9L4tzNQCpH2mDIF0aOYtj4XFFeTx4baN5k4hBT2vigU19fsy8duTLQeuXCUtf+qyJuAv77kqhYxSjB0EHkvZ5Mj3BVi+zDYRkbWpoY7IVkkFcVZC+2s+ryxoDj/QVczVlRidxNkvki61jygx5eVPUs+mhdyWK7Jq6EbTG6nw85dfI1LAYosU81NzY4G3as5+mQFvD36EA4OnzHxXFcMBRVE58yu2gYfoZy+mGmNSig14xtMLwAmeSIzeucz+YnvrxguIhs2gjSAKdG8buGW83CYnpqGX5HY0Xlq1RufQ7397eKvDRexZh//BFOsOv9ut7yGJtpfFx/OBIcpYNI12DE+1L6Ea1Gkot4oc2CNNNs8H+CIElvYbCfPPTBBHZkOm32uBbIXq/U0Ede26/iK856EYShW9idpFImxQGBCu8GgiRdh8VUYLjC5ByKpw7iRJ/2i+uW3HKBxmXO3x7LIjsloX5rNDtX1tGNpr6m1zETMyNGZ+//Q9Lal7OW660H7qTxUS3dOpqCHqLW35SkDCGEEd9P6AnAgLntZ6HpeHaXejaCLHUvEy63zZZjewza2t/+Yej2nZin8pfaeJ+jhbPgQgbpgmc9xjousa4YFF20o1ugB+ywCwjuk1UjYkloAv1VksjBQgzl7Zgv7Rhady/96w9ECW1aJD6EUM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8147.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N2pnaEFEQUN4SnkvY1hqSTRnQUxZNEIwZDFLME5JWCtyOVV1aDJUREtRclVl?=
 =?utf-8?B?RmY2ZTF5cURKaDR5ZVhjQjl5RExPQUd4VnlwUW5laDlZaWNpMk5RRGV1R0lk?=
 =?utf-8?B?R3Faem5JeGJXVWdQT2NsU2ExSzl1QTMrMHRPTUoxblpYd1c1S0RROC9XYURz?=
 =?utf-8?B?amxGeStDSkYwdE5uM2pZQVdyYjdZa3Q3UG9tLzJGMDlnZjBzaDhEdVV2aG9Y?=
 =?utf-8?B?VCtRTk1nbkNDazlFMnFjbWJ6NG5tVk1HQWU4YlhEVjNSQ0pLYmxRM2U1TkZI?=
 =?utf-8?B?MzgycHVSZnBiRUZ4c1dnMStuWnlIUEEwZFlTOVpnVjdCSGpmVDM4TTBZM3hZ?=
 =?utf-8?B?eGxlZ3F3a2IzN0t2NFVlNW93ZW9GRFJSSFh3S2t3ZWxkcFVxdURUM3o3NEwr?=
 =?utf-8?B?M3NOeWE1Ny8vK2lvTStiUTFQL1MxUUk5QTJiWXBIcWU1Y1d0Z3ZOY0JBb3h4?=
 =?utf-8?B?b2JBMnV2THBPbzQ2VmFZY0VXQis4NkNCa3lmQ2tWbDFwRG90REI0STJyZTRJ?=
 =?utf-8?B?OVdyMHJjVUFiTWZwQlVzZGovTXNDcFdrR0pSSi9Hb28zRXgzS2R1dHl4S2RH?=
 =?utf-8?B?YjgxWEZGS1RJa09BVTJYZFg2VFJIVzVqWHZpdkd6Y1oxWXF2YVR1REdUUis0?=
 =?utf-8?B?Wk5IbHdCSGFGMGpNUEVLYzlwY1BXcEt4RVpjV0RVQXdaUEo5ZmlDSVVIZmNQ?=
 =?utf-8?B?clJMU0M5clNsTFRJZ01IZkdUSXd0VkxseDYyM0VhMU90UE92TE9sOXBEakND?=
 =?utf-8?B?cHh0UEZaMjdTdGhSSFR6UmFvbzdsRTBZdVk4YVBETU9DYWowRTk4VEZzUSta?=
 =?utf-8?B?TzhNbC9BSDEvL1BhYzdYNFc1YnBhSDZYeVowNExOempxZkFqbDFTaHR3Q0Ru?=
 =?utf-8?B?bE5ieWtlbzAvQmI2TUYvQ1hWeDVPL3ZvWEFuejI3V0NEY2dZMmVQY3JyTSto?=
 =?utf-8?B?OXpTSkE5eDJqbi93ai9jUGRqc2dmc2NTa3ZKdno3U1pUQ28vMWtrd2xPYUQ3?=
 =?utf-8?B?UDBwYXNLZXo1NzU2cFNaUm1Dc29nbW9STm1SL0Q0ZVJjVUF0ZjJ0N3E1T3JN?=
 =?utf-8?B?Nk9OTVdBZVRibXNXcUF5NldFWnVZQkFBRng5Z3BVWldwNktzYmE2dVF2Y21z?=
 =?utf-8?B?ZDBzSVo0S25vb243NU5SM0xSR2xBWUJIRFYzb1ZCazNnZ1pvZGJSVE1kdXdC?=
 =?utf-8?B?YlB1YkF0ajhIcEJKYno2ZHRRT3dWQi83a0xZc1MxK0VjN3ozMFFlU3d4c2tj?=
 =?utf-8?B?eHlVTGlGWU10YndoNnhNTHY2ZCtqTlo1WG5IODFXd0ZjS1gyUGpiZFo0V3M1?=
 =?utf-8?B?elVtanJmTGMweXVsajVBc3UxM1czT1czZ2V0ZHV0K3NXWTJOYXJ4MDEvYzVY?=
 =?utf-8?B?WmoyTi9rTkRBbCtBclhUdVpkTm9uWit2N09wUkVUKzMvNkNKQzF0Y0hhVkFi?=
 =?utf-8?B?YzR0eGZCaWR6U0lQQ05LTDNxS1NkeEpobmRYL2RDMmFraXZjRXpYQ2NYOWVX?=
 =?utf-8?B?ajFiVjlhdHFtMWJ6MVYwZDNSWWZOSjRWaUg4K25ERWtTQWRldk93WDdoYkk1?=
 =?utf-8?B?RUdaaEpXSG12OFp2OVR1Nkh3QkZHY3BJYXJoUlF3SnZNYVJRVEt3MThha2Vs?=
 =?utf-8?B?RU1QTUt0b1ExMkI0aEhIaVpIeEdXbTJxaHdub0licU8wWUkvSXl6L055UVRI?=
 =?utf-8?B?OUIrRWRXT2FIWVRobVczNmN1OXF5RXZuSzRRZFhjVWwrUlJ0S2o4RklkVFVi?=
 =?utf-8?B?ajNXZDh4Smw1TlQyUGY0MmZEbmVLN1N4a3IwMndjUTA0aVJEYzBKQ2NiQ3hv?=
 =?utf-8?B?dzN3a3RtTi9CZ05ROFFvUU01TURTdlJSZDBLWmdFQ3plOUlVMUFBS0FZOFJ5?=
 =?utf-8?B?d2tXQXZyWW9ndWVFRFVWb1NVb2lyNUhFbUNwK0FTMGNEZXU5NHRBa0FNY3dq?=
 =?utf-8?B?NUw3V0Eva1FLazl2UmttS0VyVFg0Ulg2YlZHUllWRDdudW9qZFNHeHpoSlJX?=
 =?utf-8?B?VVhZSm90STBGMWpBb2h2MGdyaU03NmNLV1lJRHdYa2p0Y0cwdmlDWXh6cmxl?=
 =?utf-8?B?eXIvME11TjdhTDB6REdyN1FJUGFDU1JKWTlsVEg4dzZ5TExwSGIrOGY1dUNS?=
 =?utf-8?B?NjFKQmlhclM4U3lhUDBLakVheUlKSStBVVloc3RxWEdrdE1ESndQb29CTDlk?=
 =?utf-8?B?b1dEMEt2aVFpdnNrUVVIVXVqbkprQU96L2o1SEhteXFaSVdQRWttSWF1a1FY?=
 =?utf-8?B?bUlXajJiTzZ1QkZSM2IwWmFaT1RrYjB0eUdwK1FENUpZUDV6ZXlCaUtSOGs5?=
 =?utf-8?Q?tnAEkq9OwBbn3kza75?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8147.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f645e9-1d44-4fda-100d-08defe794c38
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 05:10:05.5864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MpeiPUF2BMxlvSXllzeyLgk1UMF5bXmn5ghXKDV+G0D10skNMLemHOUX4F7aeMGw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7260

QU1EIEdlbmVyYWwNCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogc2FzaGlrby1ib3RAa2VybmVsLm9yZyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU2Vu
dDogV2VkbmVzZGF5LCBBdWd1c3QgMTksIDIwMjYgMTE6MTcgUE0NCj4gVG86IE5lZWxpLCBTcmlu
aXZhcyA8c3Jpbml2YXMubmVlbGlAYW1kLmNvbT4NCj4gQ2M6IHZrb3VsQGtlcm5lbC5vcmc7IGRt
YWVuZ2luZUB2Z2VyLmtlcm5lbC5vcmc7IEZyYW5rLkxpQGtlcm5lbC5vcmcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCBWNiAxLzRdIGRtYWVuZ2luZTogeGlsaW54X2RtYTogRml4IE1DRE1BIGRlc2Ny
aXB0b3INCj4gZmllbGRzIGJhc2VkIG9uIERNQSBkaXJlY3Rpb24NCj4NCj4gVGhhbmsgeW91IGZv
ciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwg
aXNzdWUocykNCj4gdG8gY29uc2lkZXI6DQo+DQo+IFByZS1leGlzdGluZyBpc3N1ZXM6DQo+IC0g
W0hpZ2hdIHhpbGlueF9kbWFfdHhfc3RhdHVzIGlnbm9yZXMgdGhlIHJlcXVlc3RlZCBjb29raWUg
d2hlbiByZXBvcnRpbmcNCj4gdGhlIHJlc2lkdWUuDQo+IC0tDQo+DQo+IC0tLSBQYXRjaCBbMV06
IFtQQVRDSCBWNiAxLzRdIGRtYWVuZ2luZTogeGlsaW54X2RtYTogRml4IE1DRE1BIGRlc2NyaXB0
b3INCj4gZmllbGRzIGJhc2VkIG9uIERNQSBkaXJlY3Rpb24gLS0tIGNvbW1pdA0KPiA1YjdmYzMx
OWRlNDY2YjI2ODg0MTNlMWQ3ZThhMTM5ZDljM2Q1ZDgyDQo+IEF1dGhvcjogU3Jpbml2YXMgTmVl
bGkgPHNyaW5pdmFzLm5lZWxpQGFtZC5jb20+DQo+DQo+IGRtYWVuZ2luZTogeGlsaW54X2RtYTog
Rml4IE1DRE1BIGRlc2NyaXB0b3IgZmllbGRzIGJhc2VkIG9uIERNQSBkaXJlY3Rpb24NCj4NCj4g
VGhlIE1DRE1BIEJEIGZvcm1hdCBkaWZmZXJzIGJldHdlZW4gbWVtb3J5LXRvLWRldmljZSAoTU0y
UykgYW5kDQo+IGRldmljZS10by1tZW1vcnkgKFMyTU0pIGRpcmVjdGlvbnMuIFRoaXMgY29tbWl0
IHJlZmFjdG9ycyB0aGUgZGVzY3JpcHRvcg0KPiBzdHJ1Y3R1cmUgdG8gdXNlIHVuaW9ucyB3aXRo
IGRpcmVjdGlvbi1zcGVjaWZpYyBmaWVsZCBtYXBwaW5ncyBhbmQgdXBkYXRlcyB0aGUNCj4gcmVz
aWR1ZSBjYWxjdWxhdGlvbiBsb2dpYyB0byBzZWxlY3QgdGhlIGNvcnJlY3Qgc3RhdHVzIGZpZWxk
Lg0KPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS94aWxpbngveGlsaW54X2RtYS5jDQo+
ID4gYi9kcml2ZXJzL2RtYS94aWxpbngveGlsaW54X2RtYS5jIGluZGV4IDQwNDIzNWMxNzM1Mzgu
Ljk2NWZiNjlhMmEzYWQNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2RtYS94aWxpbngv
eGlsaW54X2RtYS5jDQo+ID4gKysrIGIvZHJpdmVycy9kbWEveGlsaW54L3hpbGlueF9kbWEuYw0K
PiBbIC4uLiBdDQo+ID4gQEAgLTEwMTMsOSArMTAyMywxMSBAQCBzdGF0aWMgdTMyIHhpbGlueF9k
bWFfZ2V0X3Jlc2lkdWUoc3RydWN0DQo+IHhpbGlueF9kbWFfY2hhbiAqY2hhbiwNCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGlsaW54X2F4aW1jZG1h
X3R4X3NlZ21lbnQsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bm9kZSk7DQo+ID4gICAgICAgICAgICAgICAgICAgICBheGltY2RtYV9odyA9ICZheGltY2RtYV9z
ZWctPmh3Ow0KPiA+IC0gICAgICAgICAgICAgICAgICAgcmVzaWR1ZSArPQ0KPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAoYXhpbWNkbWFfaHctPmNvbnRyb2wgJiBjaGFuLT54ZGV2LQ0K
PiA+bWF4X2J1ZmZlcl9sZW4pIC0NCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgKGF4
aW1jZG1hX2h3LT5zdGF0dXMgJiBjaGFuLT54ZGV2LQ0KPiA+bWF4X2J1ZmZlcl9sZW4pOw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgcmVzaWR1ZSArPSBheGltY2RtYV9ody0+Y29udHJvbCAmIGNo
YW4tPnhkZXYtDQo+ID5tYXhfYnVmZmVyX2xlbjsNCj4gPiArICAgICAgICAgICAgICAgICAgIGlm
IChjaGFuLT5kaXJlY3Rpb24gPT0gRE1BX0RFVl9UT19NRU0pDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJlc2lkdWUgLT0gYXhpbWNkbWFfaHctPnMybW1fc3RhdHVzICYNCj4gY2hh
bi0+eGRldi0+bWF4X2J1ZmZlcl9sZW47DQo+ID4gKyAgICAgICAgICAgICAgICAgICBlbHNlDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlc2lkdWUgLT0gYXhpbWNkbWFfaHctPm1t
MnNfc3RhdHVzICYNCj4gY2hhbi0+eGRldi0+bWF4X2J1ZmZlcl9sZW47DQo+ID4gICAgICAgICAg
ICAgfQ0KPiA+ICAgICB9DQo+DQo+IFtTZXZlcml0eTogSGlnaF0NCj4gVGhpcyBpc24ndCBhIGJ1
ZyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBkb2VzIHhpbGlueF9kbWFfdHhfc3RhdHVz
KCkNCj4gaWdub3JlIHRoZSByZXF1ZXN0ZWQgY29va2llIHdoZW4gcmVwb3J0aW5nIHRoZSByZXNp
ZHVlPw0KPg0KPiBMb29raW5nIGF0IHhpbGlueF9kbWFfdHhfc3RhdHVzKCkgaW4gZHJpdmVycy9k
bWEveGlsaW54L3hpbGlueF9kbWEuYywgaXQgc2VlbXMNCj4gdG8gdW5jb25kaXRpb25hbGx5IGNv
bXB1dGUgYW5kIHJldHVybiB0aGUgcmVzaWR1ZSBmb3IgdGhlIGxhc3QgZW50cnkgaW4gdGhlDQo+
IGFjdGl2ZSBsaXN0Og0KPg0KPiAgICAgICBkZXNjID0gbGlzdF9sYXN0X2VudHJ5KCZjaGFuLT5h
Y3RpdmVfbGlzdCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGlsaW54
X2RtYV90eF9kZXNjcmlwdG9yLCBub2RlKTsNCj4gICAgICAgLyoNCj4gICAgICAgICogVkRNQSBh
bmQgc2ltcGxlIG1vZGUgZG8gbm90IHN1cHBvcnQgcmVzaWR1ZSByZXBvcnRpbmcsIHNvIHRoZQ0K
PiAgICAgICAgKiByZXNpZHVlIGZpZWxkIHdpbGwgYWx3YXlzIGJlIDAuDQo+ICAgICAgICAqLw0K
PiAgICAgICBpZiAoY2hhbi0+aGFzX3NnICYmIGNoYW4tPnhkZXYtPmRtYV9jb25maWctPmRtYXR5
cGUgIT0NCj4gWERNQV9UWVBFX1ZETUEpDQo+ICAgICAgICAgICAgICAgcmVzaWR1ZSA9IHhpbGlu
eF9kbWFfZ2V0X3Jlc2lkdWUoY2hhbiwgZGVzYyk7DQo+DQo+IFRoaXMgbWVhbnMgaXQgd2lsbCBh
bHdheXMgcmVwb3J0IHRoZSByZXNpZHVlIG9mIHRoZSBtb3N0IHJlY2VudGx5IHN1Ym1pdHRlZA0K
PiB0cmFuc2FjdGlvbiwgcmF0aGVyIHRoYW4gdGhlIHRyYW5zYWN0aW9uIHRoZSBjYWxsZXIgYXNr
ZWQgYWJvdXQgdmlhIHRoZSBjb29raWUuDQo+DQo+IElmIGEgRE1BIGNsaWVudCAoZS5nLiBhIHNl
cmlhbCBkcml2ZXIgcG9sbGluZyByZXNpZHVlIGZvciBwYXJ0aWFsIFJ4IGRhdGEpIHF1ZXVlcw0K
PiBtdWx0aXBsZSBub24tY3ljbGljIHNjYXR0ZXItZ2F0aGVyIERNQSB0cmFuc2FjdGlvbnMgb24g
YSBYaWxpbnggRE1BIGNoYW5uZWwsDQo+IGlzc3VlcyB0aGVtLCBhbmQgdGhlbiBjYWxscyBkbWFl
bmdpbmVfdHhfc3RhdHVzKCkgdG8gcXVlcnkgdGhlIHJlc2lkdWUgb2YgYW4NCj4gZWFybGllciB0
cmFuc2FjdGlvbiwgaXQgd291bGQgZ2V0IHRoZSByZW1haW5pbmcgYnl0ZSBjb3VudCBvZiB0aGUg
bGFzdCBxdWV1ZWQNCj4gZGVzY3JpcHRvciBpbnN0ZWFkLg0KPg0KPiBTaG91bGQgdGhpcyBpdGVy
YXRlIHRocm91Z2ggdGhlIGFjdGl2ZSBhbmQgcGVuZGluZyBsaXN0cyB0byBsb29rIHVwIHRoZQ0K
PiBkZXNjcmlwdG9yIGFzc29jaWF0ZWQgd2l0aCB0aGUgcmVxdWVzdGVkIGNvb2tpZT8NCj4NCg0K
VGhlIGlzc3VlIHBvaW50ZWQgb3V0IGlzIHByZS1leGlzdGluZyBhbmQgbm90IGludHJvZHVjZWQg
YnkgdGhpcyBwYXRjaC4gSSB3aWxsIGFkZHJlc3MgYWxsIHByZS1leGlzdGluZyBpc3N1ZXMgaW4g
YSBzZXBhcmF0ZSBwYXRjaCBzZXJpZXMuDQoNClRoYW5rcw0KU3Jpbml2YXMgTmVlbGkNCg0KPiAt
LQ0KPiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQv
MjAyNjA4MTgxNzQxNTEuMTYwODk3MS0NCj4gMS1zcmluaXZhcy5uZWVsaUBhbWQuY29tP3BhcnQ9
MQ0K
