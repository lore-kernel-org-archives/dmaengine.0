Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793820630;
	b=R/CKPf6G62mcQeZRAUA/cOwZ/EKAfyRU4y9y2MQVqkhQKMwnydMEkXKHdy8Giim9VeD5
	 ySlh+kdg9LqB5Wkkq/yCVLAcwsT1o4KNtWirMlG8YD9i24EqUNwOCAPVAjbLApQE5qZKd
	 uGaYBVAiDdYA+wW/9KnDeSipwixX8XT9tisRXF+lE6y6lCwlpsDMnilUYch7NmiUSW//s
	 gxuxydnYAo6gYHPI3dgWus2VzqP2is+lWsS4aI9YELwe0aYpTv0jIRjVmkZNQH2X0iWbc
	 u0H+PgutMx5KJ6c5rNJJYsTxDYz6s44uiE2QM/ewQ+F9dX6zDuV361I7FarYVMSV4cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820630;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=IRNs7zYA0aT3epFpyLEAtwrhkoNWXX5xgD9aycVHw70=;
	b=yJHpxNXzVYRkmBGRqadfajiWn2utCELQRpVDqx0tFBdzPPOomh9JpRVjQn2JS6oaCfBK
	 6wWTGv8r1JR+GPyo63nsErgtfUmlOh7rtRyV/AYtRri/9rKy5g+6OW34IdfSEde3h5R2l
	 ymN1L2AXi1EZBekx9GejMuc1oAgcSLbfQiia3Q47j2ydYc8vL4gndOKamnP5X+Ll/hiHk
	 ZYwCjf5ZvAxjqBOBgyp+wSVubHPl7/rGg+VfPOD6jw7cXc8MA5iTa1xqKt5VQUywtklZw
	 y9Z3WJgiDqIejxW9FtLcmmQdfhjf4QRANNRzYTMrRHkxJCXG2Q1kbjBEc/7eEGft5pA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=cTyDq1om;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.32
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013032.outbound.protection.outlook.com [52.101.72.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFF0606B2F9;
	Wed,  4 Nov 2026 19:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDFF0606B2F9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=cTyDq1om
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0uklvwcpPa3xLsxL0QyQDJmsXtcTZ1xaDBzOpnW7Y/Hm87HV+hFkkewQ4+1BJYUmRYKoKuOxrTFYUTp74SpNRauflJFS7nXamfbuy9cRAUGEWBSaxnpVz7MTUjFUO2Bl3/7QL2DXqWD0lYQWHm1S1B6SG56pie1V9MtijnYXUwi7h3j/MjwmD9EjC1FiclNHq/mPcAUB7uvjqZWZ85rSUN433ksVJQdtPcdHtzR5NDL9+mUG3VvbjqF41U0FQ6RzVDvzPGASuElUoF4s/SYuFdK7OJfZU/Lwpn70ErF+AFHUo42g/L4OFhpSFVO+WdiscRmNp3ugThOxLILO9Z3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRNs7zYA0aT3epFpyLEAtwrhkoNWXX5xgD9aycVHw70=;
 b=KDUE2Vs3pP+/mjn3C9cYZdGatRJ/PiNzttzQdtimwL/nKX2o5qqhwXPxGxP6lb+GO6C/aTMMEbdpOffAATl/TZVbeymNiYeCtQvTeNF20mAq4gIEM2yrGLDqQQqniPUkDug2iFdVeTPztgnYC8IOBoYRD1FENE+aMPqOx0iZ/v/YlA82jf1bsciLucV70BEFspjLsJf98+OnUMPqqY/NSYIlP1PdGGqhqd9wQZwXhBY42XVIvgdOyWtypxOrGUivT5DuXz95k0p3YA/ma+hRP11EWHJMpeQ2S8C95hzpz+1RuINNrdY/wtgqBivh2r+/TsxgnoLc/iMDXD20wFJbrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRNs7zYA0aT3epFpyLEAtwrhkoNWXX5xgD9aycVHw70=;
 b=cTyDq1omYMkmr7ZysbOXg0ntqzXkwgW2vEPNTjBE4UegKFYq1URyFWSKdTaEtheqQmDNBkHR3h84Jfdcvxr27JgYeMZMAS8PEbRr4wbj74uYmmDh6oL5gAxCOt1ulQERXoHNBqW7RBkBOZoO60MXXoWl4h/4RIjXsi/x3bpaML+Y6s2Aqbntpcy0bVcviKRcyVIKY9n9mszu0oNGtr8CRhMPIfBLFQJooRKyXwZs4CogPViRlZGQkKA80rxecdHzo4hpsTN8TzWDZnl+rnW/jx3t9R8OOBodPlNKZVNRqe9vvrjPcYIHapAW0XCfSOiqzOFYUyHOPuYSWZiBceAj6A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB12014.eurprd04.prod.outlook.com (2603:10a6:150:2be::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 19:30:26 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 19:30:26 +0000
Date: Wed, 4 Nov 2026 13:30:19 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Shan-Chun Hung <shanchun1218@gmail.com>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH 2/2] dmaengine: ma35d1-pdma: Add MA35D1 PDMA driver
Message-ID: <auuHy9_GAzYZL9V5@SMW015318>
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
 <20261103022202.2139674-3-shanchun1218@gmail.com>
 <sashiko-outbox-194466@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-194466@kernel.org>
X-ClientProxiedBy: DM6PR01CA0001.prod.exchangelabs.com (2603:10b6:5:296::6) To
 MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB12014:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef542fc-d8fe-41b7-dda4-08df3aaa142a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|22082099003|18002099003|11063799006|261022115727099003|4143699003|56012099006|261021123027099003|261022105027099003|261028144727099003|261026140227099003|261026121527099003|261026135527099003|261026130827099003|261102124527099003|261009223027099003|261022075727099003|261022113327099003|261021133027099003|261021121427099003|261021135927099003|261021130227099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	7t5XEzApALiCRvyImPkxx7CeGgFubXUUUJuzOR0U+/5qzR4pOSozVdq0YhkR5UVD8XUyBuMj9sbTabOhJtioNA6fbcVfCVMHRIw4jLeeyhOEhYVnHEWydT1rdq2iF1aoFpbIc/sREV4E3ZoLrVhKNJhn8c3lbdt8q8ta4CNbiFFES/mYN2cwn+NrTYO/p3aSKI2LVdGemUneh5oeVT1AJe/Ln5DOhHMgaB1oISTb3z6RzWYIu7Rr2J0x9l1flbRaHX6DQdp4Wcd+soi4HKZfjwc9QPpabL4K6CeCQ2bbWBNDbCyyPXDueP+Elb5FqlqnJRGqkW7ryCo9rluauP/XRVtPwrVI86ASFLFReOXs2iDbk7XfJbr28eUE44whNZd871sDFrqf4LO8EEjNSxHHKNGM2spO3iJYQIRukZySVWwnOaJoNwqN7cpIGYqfYUO1U7FtuaiHz3yZalgbE1PyO9t+O+S0iY0JibnimcJ77hkWdqUzIxYyGzOuSf36GaIMbmV/WB/gZ1t6cYEzOopMyv4XOQIlch5qE7yzM4uRqFMAhshPiSL/RUA4OcgAAE4v7Lb+fmoLLxL23iiPSTMHzzG/FKJ4KKr7RKIkKkApn7jliPtDiQMmvhAe285+LPNY2XzpDu68i12BaQhUqbEQ2he+JIfxU256eLd9WqTsggQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(261022115727099003)(4143699003)(56012099006)(261021123027099003)(261022105027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261026135527099003)(261026130827099003)(261102124527099003)(261009223027099003)(261022075727099003)(261022113327099003)(261021133027099003)(261021121427099003)(261021135927099003)(261021130227099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UFZ6sbeISppdZCKqnRFa0WoURMQK6r/qIteSj/7KBvJ8d6v8Q7bVQsO56Nfk?=
 =?us-ascii?Q?r+LOoIoZpbcvBrZMQi3oY3jg5xdc3krUu77bXX6F11TCu966OscUS879Q29V?=
 =?us-ascii?Q?9w55ZaDQcqGJFMVRaQbQKTDjUG9AjcLnGLGn8QsV0YCDg6ZiVAEiPGppdpFa?=
 =?us-ascii?Q?EDOVZ6V+/wB0j3duKxA8z2LKxol3mG9q20YaGKrWFwjmUGmucbwt2w8JIEjC?=
 =?us-ascii?Q?8KZb6G9YLKf6l45WMezq1TVkJAxXoa5WrLAB/yrW9615+rVr/iDrqql3xtQ6?=
 =?us-ascii?Q?D81gh/cBDWhbwhDal3Lqi2OYUVY94OJvhkr9nA7rQUMdGcn+yQV0Fie9Mck1?=
 =?us-ascii?Q?69IyZ4L8kC97T2XTXJjbd7bira3PGLQ8RyYPKK4Z2ZXeCOf86Z3GVkoYakf7?=
 =?us-ascii?Q?akrDbYRn6ngvzQDUjJ6D/hQAL62014Iqtu6WhdZXTieoIjZrLxyVXceKiWSD?=
 =?us-ascii?Q?TEkHHJLpD8SgVWBuB6cacUQ4tS/UGfpnNFK++yo/P9Zopn+jFlFvTf5EHY3M?=
 =?us-ascii?Q?0njxjJjPOIEHMOeIIe3QC6pYWq3Dh7rUVkExwm1FP681ZXi749zxhEFEE8p7?=
 =?us-ascii?Q?HILeghacLNK1OQyq5SjG8X36D4bZ/RlJg92ZqwvW5XkkgPXPE1ckL0A6w1p/?=
 =?us-ascii?Q?Fd2ButbHRNVnrRnRimueldT32dcHlnnPmWmP+jyeKDSpz+a80yELgHX7lUHL?=
 =?us-ascii?Q?iGJims2W+mQ0OOVQYXZXVukaI9ZusoC1nhjrQKkkN2m8buw/HgNBn1ra5Tql?=
 =?us-ascii?Q?VswaQC3hZ/vsfemIu/4I9fun5g8ns6tp/y68dJ7U7E3fG6u3myAVIPRjhyf+?=
 =?us-ascii?Q?bQX9T54z+cPKyuwmD3mA4Z49kBAqKwIjoYZArz7ZdUUl4uFeHSdFU0M3NSO5?=
 =?us-ascii?Q?NU80c+Rg2dsEz2pvkFhdls5NmAJtOSot0CIXcfgPpiIf+iOfc00678wR9i6X?=
 =?us-ascii?Q?iM60y5hXkBdKNGa+QVLBGFeCkA0kNS4lsbaOCCgUEwVgj5rs884GoWO6lSjC?=
 =?us-ascii?Q?rNDz/dU8g9mJXrJA/7bQVDDeFp9RUcHvi+WHxulSV28Fwg8x4v0FCnRidhmp?=
 =?us-ascii?Q?uhe610aA0dpSPdH50e0Gqv87rQrHyeVrfOWmFq2NK2HFCKNAPAvOznWTKi9O?=
 =?us-ascii?Q?9DVmqumcoHFCE6Wmjmtj+ao/5t3EIl2Boe04j3pcA9i2Uy8TQtx8UPz0VbVG?=
 =?us-ascii?Q?TUWMqg9CSQsIFeyDuqWiF1HqJN8QS5URoD07n9Nz3HcNvpzHF4XD+R4seYl/?=
 =?us-ascii?Q?JCsaCsGBm8NRW5Tw1cwFKslTDR93PePjmcwSK2GHUeD0Yinf6Y5hpVJwIqwD?=
 =?us-ascii?Q?8Vangf4EIxaFKxICiVDJWbyHAACUMxiIHf1qZmgzwJK9qk9WLtcTuheYBKd6?=
 =?us-ascii?Q?Tre3SoJBSwU39rQ1ePM+iv9k19lGLPSOoUYmM9TyKfraH01pa4Yvnw6Iyool?=
 =?us-ascii?Q?CHW/lxN+2EcavK+2OV4RLW/8O0AX2yoMmtZwbxmJXiJoqPi+fC834Q7FjmiA?=
 =?us-ascii?Q?GjLvck0mwP7z282yHF18aOuVS5WOC2hpNf4im5m6tz+u4WdQQvM2GnYG90oh?=
 =?us-ascii?Q?lgb1Cf/g5oD4WeHLo+WiTVNpE21UCy7TsKpHgfE01zqucf/6jLSVnvkUMb+M?=
 =?us-ascii?Q?nLQHxZyXqYNnOkFfr0JvcK/Qs9zSSer9PJLbnZQ4Z6QQ1dsh8Yid9mWiD7zj?=
 =?us-ascii?Q?Au8JjBqwDwQDUcGqX2eIfEYt57sA/UBJYdR8VB9Tfx4kRikEv+E+zWp2Jd9m?=
 =?us-ascii?Q?Dea3FARpSlFx0u3HoSoybYNSDly6TejPDHwjx1/mDWP6YXSg3JRd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef542fc-d8fe-41b7-dda4-08df3aaa142a
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 19:30:26.8867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVeJrpMNNSreWeaO2HLVXNQf7IAspzSO5xCR8bd4Nt5tliNrdYoW0M8ZJ45Ne50XeE8lsaUoCstGLwk48EWIuiRzKKqG8psGfP9p+ZydQS+wMf6zxagD6daSacpxtEg4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12014

On Tue, Nov 03, 2026 at 02:43:08AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 11 potential issue(s) to consider:
> - [Critical] dmaengine: ma35d1: premature register setup in ma35d1_desc_alloc() and prep
> - [Critical] dmaengine: ma35d1: active DMA after timeout and double completion in IRQ
> - [High] dmaengine: ma35d1: missing PDMA_TBINTDIS in ma35d1_prep_dma_memcpy()
> - [High] dmaengine: ma35d1: unvalidated SG segment lengths in ma35d1_prep_slave_sg()
> - [High] dmaengine: ma35d1: broken residue and status reporting in ma35d1_tx_status()
> - [High] dmaengine: ma35d1: unlocked PDMA_TOUTEN RMW in ma35d1_pdma_interrupt()
> - [High] dmaengine: ma35d1: state bugs in ma35d1_of_xlate() and free_chan_resources()
> - [High] dmaengine: ma35d1-pdma: fix signed dma-channels pointer and zero bounds check
> - [High] dmaengine: ma35d1-pdma: unsafe teardown order in ma35d1_pdma_remove()
> - [Medium] dmaengine: ma35d1-pdma: disable channel timeout in ma35d1_terminate_all()
> - [Medium] dmaengine: ma35d1-pdma: unreleased ch->desc and stale ch->cfg in ma35d1_free_chan_resources()
> --

Please fix these issues.

Frank
