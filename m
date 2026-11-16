Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794860270;
	b=MQvJKWFvrag5bIf3hRwJLye1jQlQ+V0B8m81FczMIWwGLvG3+upJ6S4r4Qxwo23XBHOP
	 m+4VmCViSFmVd+laFYJ6XMJK6ulbyzusvE0UpOrxB8r3rImB3543EWGSEIytAuCHHINdJ
	 Ec1vSZ3i33FePza0sbo7I6VDmjHLjor4Z/LWMuVrx4LiraLDP0mFkmNjrx6ktjmwGCn9p
	 T4LjPw+SeA5sP7DtrV0IIicAlIkntUMigpQk51+b+YSIXpqWlu++qhjAXpIBkXGB17jUD
	 0OWWn/lAPOjCPyEPgFOA8kwvk9LTYSqiqe1NtAL2K8fUKJwGIN21qA5riPuqHzOQPHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860270;
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
	bh=5MqbVMOiMCU+LWBOH0E/NzA7j++eBkdaleGA0KaG0xs=;
	b=PEpkdA8pVPk5Sy4h2/dyBnSPES/7qCQFQc7C6DfeULe4JIEcBFhB5FliWwmxA54Ne29P
	 DQ6cF1rY76h7LFFA9ZIhAgONfogc0HzGBfGTEQPBX6AUajDofp1WlD5FBCahCw9/b6Uit
	 2javtgko0xTSzCxGYd926yvUYfousk0aGWKEyBunmDMSeqG3OjrlimX2vbchcuSd/N0pY
	 fJnlqXb3pSu3HziS56N2KvZPbQV2vULObGx8scMBGfUccch51il364FV8wMsNtJa0CVuI
	 jMPGLjucc60Vja+/x3OxiEAcMkwDfWiFgmEuDdonwq9OJk6a9uJNGcRAv+Ar3a5ck0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=PnVLDt9L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.16
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A989A606A336;
	Mon, 16 Nov 2026 20:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A989A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=PnVLDt9L
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcaqL9vDtjbPu9ysZYEv/tvUiXm1CG4W+h18iALNJubYN2NY10qwwkQmW/CGL94WWdOrAXt2D1ayjpKV36rxlEEY8SBmJkLhnhQTF5uC9um3AXUsdWQAI72s4vE/iaBL+xtm7IrQnUglZd6RegRuXq1o+z1G/dkYi9F4idbLm8XPn1Jcjd7wSZ34xlUdp4T46CrdROxNuNNULjyDDuYiJbLsqCE+AesetQmKGNZbBhX5FhXb5Z0L4mBySxBc78NHaDlkFRhPd6FhZQtN8pyMxsSSoZHnYdaWAGGWPqNzvMiMJwTmMP2EjMhHi5PGhMrFcRfSWwirnYftpitjiMouJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MqbVMOiMCU+LWBOH0E/NzA7j++eBkdaleGA0KaG0xs=;
 b=UH6jf1vmQ9BpDyCOJ+TsfFJH3UnAqK+7cVS5NJcV8ieQwunb0p66xARHwv6fVrjfdq62b2/KPhlMkAgFkuWuKVD/VdlSsCqmLRXB+ecHIkOvJKafpEKhzlmFF2f+WP61C5eURp6Qu7/0tE8g0kFGeJS7KMKEMDihRaPkLaFMOM+GfaDMcV02+84Z2uivux/uwR/yHZ7YlSi9DBXzYHKd57IQAyGIDnHq838dpAgrLtN13mFc/yYAYDHgEW7iWuA6BfCCzwlo9+puMPNhNfibjNK3kJRIdWBoqN1z8c/Dm8WdoVvEbq1bIjv/RXxVWJIn8DcFd2ypFJ+jScqImtr7cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MqbVMOiMCU+LWBOH0E/NzA7j++eBkdaleGA0KaG0xs=;
 b=PnVLDt9LU+EaHFvOFIO19Hb0hQXD5uc0zTYw+U8TAos4X8bkefrA8R3gH9HsFDdf6nM83jq3eklFgHITKl0XMi8t9V70yqhdwZpvc6g0TSTG14u2y+XJ2zJgE3d83xzQsjS+yABGEEeJLYPa9hJ1B5MyyynI3bmSEg9tYl5Nyhbp/+mVAlda7Pi3MSdaEHBSJgx2JzQddplNOrZzb/lRQJS9ICMTduevk5QMqPQkE4jQDqWfwq/UJQ8avNtZ4GpHRiOS7iO3gFXgHpEfcTU1bkvjMZ7kOn15keuvNRhjRofZ9rt0d66ocwrPVXtZlE48MZ2mXyS2iguv3vkhE0fRMA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by FRWPR04MB11198.eurprd04.prod.outlook.com (2603:10a6:d10:171::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 20:17:46 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:17:45 +0000
Date: Mon, 16 Nov 2026 14:17:36 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Changyul Lee <lcy8047@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: Free channel and device IDs correctly
Message-ID: <avtk4Lw1ifG9n_mh@SMW015318>
References: <20261106005154.1669214-1-lcy8047@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106005154.1669214-1-lcy8047@gmail.com>
X-ClientProxiedBy: PH0PR07CA0099.namprd07.prod.outlook.com
 (2603:10b6:510:4::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|FRWPR04MB11198:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b03756-5b8c-4fda-fadc-08df441ead4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|376014|22082099003|18002099003|11063799006|56012099006|10067099003|261026121527099003|261022105027099003|261022075727099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|261102130727099003|261026140227099003|260925021311599003|260925022911599003|260925021911599003;
X-Microsoft-Antispam-Message-Info:
	0GFV1hSfVE6nonD8Zf0zZDBZ06lxGe2Vdids36E4O0LDTaH6vZ4MKGvcnJ7cXudARVxJ5TPC4svGN547GQlhyrw/MlFXVndLO2y1Fz0J6MljS5omxCGLOrq36CtqsHeFtdgLCEanSfE2GNBD0GGA29WBRaLuUQJo8zNuJlGgxWsBpADBJJ5UOU0oUzhJw5GNA8exay8TU3upXBcGPYIaT+dUfNEzxdevNum8rCZg0WlvHjVrf+IcDpRZ6oPUTFITHgQ0wcCLLZr2R7C0KibjN6xAKDK5vM8DS9Gf7xYg/3Zk3J5VwSDKN3ZIhgX8ynPj09HP+BDf8YDxyiWdj/m7J1HgCruqU6CkRvhSXq0IDUJA3LYydVfb3WFcFWUnEXIm11H8a6sHGh7xfac0cPioFrefmOea/zjr3iJMv8guRmkyIcBsAAsaSjomklHTqGg/SmeYyGEKJvlc21rKXi7ihRcp6R4Hj5w8TmwCq72VFN1mAgdqVupDJN7SCtBesafFI5BiKdSbAqJQDPkDEqSgm8JtngTt5ZBA5cmPvG1GUH+QBRPX8I6EtLHpbqiKhikleD7OQd0BjWoc04tOsWNAyM2Mfd3OM6T7r4B1Yx8kqQnlbubDXonuI9LOupmia499yqXpy+RGIucT+PalHiibJ+Yr6GR7k2RFlOtbHL3vhTc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(261026121527099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(261102130727099003)(261026140227099003)(260925021311599003)(260925022911599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0wnZ3LA+lgXhQG6qDeiE0f2FkqAMMI8WvA1CUr05uN7KtLnklJVvZYBMZtHN?=
 =?us-ascii?Q?GmpdaCqFwFKdCHEBEElUGWvtyeIxj6d2zK5wJ3kIowxdDdUSyL9LehoimGTf?=
 =?us-ascii?Q?gheQFiRRD/6i+9V8gjd3y7YBDJYPkiRrY6Y7j5e+tTLdtnh8lyS2Or921XBA?=
 =?us-ascii?Q?dXM51upAgeiTCmJ/OMdgjEN3O3uJi9oYuvLtpZ/bi7/afEXrp2SRMvwiShZK?=
 =?us-ascii?Q?H5gDkSqLUfMq01aj1qxWaFF26kyMEf0NRAn2a42mGRK6JqSd53OJUG+FyVJe?=
 =?us-ascii?Q?VFvRlimPf4i7kRPAV7+qvePMm0xqe4rozsFNASO8Zt7t5qIR7xW3ULrSyIcr?=
 =?us-ascii?Q?5j7qtBucx5gp+6aerBA+PDnSVl+OQ/w5NQUP/jhJJSYHxkbG+setgkWugwTu?=
 =?us-ascii?Q?/FvAKfMIvVhGHZhVXOMc2zCz0ilzxI2yG4Qds3TmpD8zD5CVywMJlX1COcE5?=
 =?us-ascii?Q?E7XYpJi9QRQwqy2TK3GDNdaJwAj/AlAKDzp3bhuN5iCpsJy6BF0adYX6qBLl?=
 =?us-ascii?Q?WDFUb5NpvZipr2EONSilyMjqFm6W3YRJUq+qlLzwNAhxWBuohBDzOj4IN9sG?=
 =?us-ascii?Q?85TjIhpF9IorDpU7/WGSj/fdAQ9gRvC1WWFW6JdACGmxtHKYfcOVeo9zHtRn?=
 =?us-ascii?Q?ldcVbJIq/bwCPUD5uRlkwrlv9n6h8GRJaQBoNrqWH75Sqcbou9SD+Tw9PGvX?=
 =?us-ascii?Q?dFHeFQYN+d0ZL1y/hBOhCC+T4yty7qQYWIHkcgCd2r30fVUKLAAmnmuHrYqd?=
 =?us-ascii?Q?d6uxE5a3eeBsng5P/5UcJ7W14pIrVEHuDEq6H0COkd2OdCPdSt3ZSWA6+h2R?=
 =?us-ascii?Q?hLwEooeZOuGr6YjrexmT04+FLiCgC5QauTZ5yC8dbgWx18SvcYbW4ey2QsUZ?=
 =?us-ascii?Q?onky6awZMR6QNK1y+XqEXQ8205nEJjmkXnRO3NhU6vAGCfMotuxlP9U0r3+x?=
 =?us-ascii?Q?O6Y3beRu8PZPiHRidPUfxIjdkDAF2JcAEMT89j1s1P9dUhY/YoLH9VeSxk9R?=
 =?us-ascii?Q?QrsjuYrLGjzL0Qglif+8w9lNTdDiTOK4p1h+N79dGm9mo9S9vvIAC5KVF2SX?=
 =?us-ascii?Q?t0BKm0PqrxsvFz8VUa0iKSeyZw9psvfiaelMqsge5T02PrFs3V61mnImFqWw?=
 =?us-ascii?Q?OOEPVZudWk7wgDJ4ENQwVrqYicrB8DKlmiQqAQYnNkt+D9bQsk6orztdoWA5?=
 =?us-ascii?Q?ugalryWNM53Y3Nm6tQm48R70XCMbnfjiieMwOa6WsiWWZW6tkPmJfvgTK9Sq?=
 =?us-ascii?Q?D0o+ReC/yCCRr3JtScCobBWdDweGubiSC+Rsc6jNEmCTq4Dlq3LttgnLcK70?=
 =?us-ascii?Q?JnJfVfc60Isi6hnADViwU45XmMWAxAgxeotWrAp50IYw3idsQzjd3l9nrjzA?=
 =?us-ascii?Q?w1Qd3Qxcda9UtOizu6vtdCgZTd1iaRK3GZWjNZnuNYWFjH4umHyvR69zAV4o?=
 =?us-ascii?Q?RZI2xrEL9nksK1ddeyDh2LnbCJD3cjKjlDmBikjT2dBKt4YwpAn4GRD7iob4?=
 =?us-ascii?Q?riWvqX19m6gMN3rG00/i9DqMFG07FQc4MWxI8to2aCQtBE5xRZBRPq6ce/+3?=
 =?us-ascii?Q?oYr5RoaxrDB648r78JWc6yE/HSg+BtiCUo1o4/57UDAE/UPtgmegbpqB2lGp?=
 =?us-ascii?Q?kC7b8ICY65Pg5qzBS0jdoNshFu/yzCe99g2wqxaz5PoDozE7uMauiPXG8W8/?=
 =?us-ascii?Q?9sGbh2pW9n6ZTMRO46LuCyrHvUuoGAg51p+q204IRovewMGIsGGUNQ0VCMlH?=
 =?us-ascii?Q?vMSDF2MC4X4cwCkwlux305zbfw92U9IFH1lTUl27oR/3SaSDx5wP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b03756-5b8c-4fda-fadc-08df441ead4b
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 20:17:45.9075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJCVGiBAc0n5q0GJ4KwDRnwqe9yY3Pso2wZQnxiwvWUXgVCPQEnr/PWFPBBUZugGcq3PMQeWi6dOML5BhfKCNt0eY5apQHPy8H8inLdUE1rpuNpqDV/7zI+JbsdI89wO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11198

On Thu, Nov 05, 2026 at 07:51:54PM -0500, Changyul Lee wrote:
> [You don't often get email from lcy8047@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Commit 0821009445a8 ("dmaengine: fix channel index enumeration") added
> device->chan_ida and moved freeing device->dev_id from chan_dev_release()
> to dma_async_device_unregister(). Since then, two paths handle these IDs
> incorrectly.
>
> __dma_async_device_channel_unregister() frees chan->chan_id before
> device_unregister() removes the channel's sysfs entry. A channel
> registered on the same device in that window can get the same ID, and
> its device_register() fails:
>
>   sysfs: cannot create duplicate filename '/devices/platform/...
>   kobject: kobject_add_internal failed for dma0chan0 with -EEXIST, ...
>
> idxd can hit this when one wq is unbound while another wq of the same
> device is bound, because it holds only the per-wq lock.
>
> When dma_async_device_register() fails after registering at least one
> channel, its err_out path unregisters the channel devices but frees
> neither the channel IDs nor device->dev_id. The next DMA device then
> gets the next "dma<N>" number, skipping the leaked one.
>
> In __dma_async_device_channel_unregister(), free chan_id after
> device_unregister(). In the err_out path, add the missing frees: each
> chan_id after device_unregister(), and dev_id after the loop.
>
> Fixes: 0821009445a8 ("dmaengine: fix channel index enumeration")
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Notes:
>     Found with a static analysis tool we are developing.
>
>     Tested in QEMU (x86_64) with two test modules:
>
>     - Unregister one channel and register another on the same dma_device
>       from a second thread. A class_interface remove_dev() callback on the
>       dma class starts the second thread while device_del() of the first
>       channel is in progress, to make the window deterministic. Without
>       this patch the new channel gets ID 0 and fails with -EEXIST. With it,
>       the new channel gets ID 1 and is registered.
>
>     - Register a dma_device whose second channel fails to register (both
>       channels request the same static channel ID). Without this patch
>       chan_ida is not empty afterwards and the next dma_device gets dev_id
>       1. With it, chan_ida is empty and dev_id 0 is reused.
>
>     Not tested on idxd hardware.
>
>  drivers/dma/dmaengine.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 34be53487a21..6f9dcc735af5 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -1171,8 +1171,8 @@ static void __dma_async_device_channel_unregister(struct dma_device *device,
>         device->chancnt--;
>         chan->chan_dev->chan = NULL;
>         mutex_unlock(&dma_list_mutex);
> -       ida_free(&device->chan_ida, chan->chan_id);
>         device_unregister(dmaengine_chan_dev(chan));
> +       ida_free(&device->chan_ida, chan->chan_id);
>         free_percpu(chan->local);
>  }
>
> @@ -1307,8 +1307,10 @@ int dma_async_device_register(struct dma_device *device)
>                 chan->chan_dev->chan = NULL;
>                 mutex_unlock(&dma_list_mutex);
>                 device_unregister(dmaengine_chan_dev(chan));
> +               ida_free(&device->chan_ida, chan->chan_id);
>                 free_percpu(chan->local);
>         }
> +       ida_free(&dma_ida, device->dev_id);
>         return rc;
>  }
>  EXPORT_SYMBOL(dma_async_device_register);
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --
> 2.43.0
>
