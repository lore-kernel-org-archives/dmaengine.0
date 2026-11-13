Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601463;
	b=vzyD5cioEInvglzrnGCpgrZkrt2lmQSh7p0ux0XHtLGqZalVc4LNveRTrNCLRdZKAtUF
	 vraucjkqwUxlsNEoAJwgSagsumlgzNs9Af1V6RDSBq5jDd693EuAqB9umkP3/Mk4AuP91
	 VEEbJFV8J2Ba8j92o3qRMCa1G/eYtIAPmjLXerjpSgb1AwT9uwdRhGbqioSPh3Uo6Svmz
	 EFj1L84W2c4G8PumYiqWCIm47DEVr7ickNDYcBxP8W9FGdt7gZFGco24GEMziqiE/Oo00
	 s5ArUEV9cR5+srnoIza3YykdX0ZSDCcIXnhg+CECN4c0JqKMw8kcdXwFEDPviFzjXUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601463;
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
	bh=SbaZ7Na8awbYtOZSM801aBFhAfKp/KzswHg05zNfWBY=;
	b=gkWvTGtKtBeqUGgLe+pUneqHFt9L82+cErjM6SQ3EEZevdxL0sbTlNx3eATbuJ4n1Fu5
	 Nw1e3iNEJ7n0DXCYCQksooz3hIRYiOvYluYQW1SI2tkgYJ1YDrid1EQ5o4MaDPXFb7Uv6
	 z5VzQ1FbQNcQEV0SuOx5yel42QFYnoXUq+rlOZVJDbKQxIOvIkp3lDwH9J5Rx1v/A+du6
	 jNNIeixyxPbnyLlHtyM9esQMJF3bWyIq8UlBJH/ANHq4Zg2t72mB2E4dnOurnxGLSVVUW
	 cheT095iP0HiVNyqTWbW2Jbk4PlLlkOcwiPhN/CgAsut4iIc1TGmH9mDketRNBItVXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Xd+sYFDn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.66
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013066.outbound.protection.outlook.com [40.107.162.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A94D606A337;
	Fri, 13 Nov 2026 20:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A94D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Xd+sYFDn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nD+5JfUfr+vLc1Ea/25/X0h5p2MkcGmRHkffldL4R2c5yujD10GawlWGci+06jpo+go+TMD+lhn2/ZqiXUq42Efyw1zX+mZvbFIEfFlcF9Oku2/csEDF53NHvDKUXUnjd1B4XuUA0UNK/XDuSYXEsZil9c4AstX8lgZHnf1vSMnJWuEaGvSpwik5nduj+N3zLZ+v/BgwuND4Q1AmIR3bLQ1SOpNWX42EhX/9cbFp+/7WZMR7anAL/qW41w9p5LVKeGYCJX1A6nKyjpXuBEKoNJFFQa3anUQJCLkkg4s1GH56SzTDi62e91kO6kU1gpAiURnk/kROZ1N55drmUvH+Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbaZ7Na8awbYtOZSM801aBFhAfKp/KzswHg05zNfWBY=;
 b=E2+X32nenC4SipwHaqsy3obdejCRyKK8+8eVHvaZD0EJ3zfLdHXDSuJYhF1OpU3YxTxf6kOZOtV7xvy0xSzs4ZRrpqRsZDAjH+bBkk6uK6YIVsP9rmZIXjTydCao6fPMT4QKvjZLO5cx57E16bFsQv88y8EkR4KUJIj0WKvEYQI+7CP2MEqdqbdMBddjVW4gY3K8SrDt8wDaKLV7GeaEtOBDJwClCGi5DmDVcN4zeHBxb0LKT71/u4qCuNu4JMpwV8ENQDimx60+5Sqmh8FP7Gp1YYfknztfS6+lJAc3jQ4FgMKA0y5UJXAEn1yrNogf7jAp/TC1V9DVbNzv21FsAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbaZ7Na8awbYtOZSM801aBFhAfKp/KzswHg05zNfWBY=;
 b=Xd+sYFDnMfpZh0LZlVpxxRfVpD2z5S2BVyVa5MJzZw64DM5+poZsC9vJ94Kw2RYmrQT71+MyI5NLPUA/P/xq48vo5A0pUR2rwzljbOIgAwR18b/PaIlubfZTQ6cfiKL88EjfjjJdAw3AWQJ789PUPWWo0/E9mAVOn/7ElvkSLL1BgOh6bBj+lA2E/SteaKzR0a/80hZKSh7nZY8jOlsig/sOkyhoTJ3t/PFfvikH5sKiFAZXWmGNPncR0bWiYQOu2hSnDnJojJsAf65sKL299/5lN/9Zep8gfGYx+OCEa2ldqKhS5BskpL6RPkj587lAcI8/d3KgE+d+ofDVYYGUqQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV2PR04MB11589.eurprd04.prod.outlook.com (2603:10a6:150:2b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 20:24:19 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 20:24:19 +0000
Date: Fri, 13 Nov 2026 15:24:11 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Ripard <mripard@kernel.org>,
	Jens Kuske <jenskuske@gmail.com>,
	Jean-Francois Moine <moinejf@free.fr>,
	Hongling Zeng <zenghongling@kylinos.cn>,
	Chengfeng Ye <cyeaa@connect.ust.hk>,
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 8/9] dmaengine: sun6i: synchronize callbacks before
 releasing channel resources
Message-ID: <avdx68eCt4X8ID-u@lizhi-Precision-Tower-5810>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
 <20261023-submit-sun6i-dma-lifetime-next-v1-v3-8-ef1acb0be768@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-8-ef1acb0be768@gmail.com>
X-ClientProxiedBy: DSSP220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:3d3::9)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV2PR04MB11589:EE_
X-MS-Office365-Filtering-Correlation-Id: 8125fc95-a116-4e3b-3c79-08df41c418a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|23010399003|10067099003|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261009223027099003|261102123227099003|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	QBQRZCwlzDe3+J4gXa8opIBOHwXtAf8yQ1Wv/41UC8IIRh2z5yeYg69Ye3ooKn41aJXnuNq18HgcQVGLes/4cXi+SUXxxHBcETdJ7UBzuugCxbTplBLGZmM8iePZTROhLg4pehAZo/fBHT6tDcwQD5atL5+OE6Pa5d9my4fhDZPY/4yvmK4hQ55FMz4FvfgNhyuzVAJgsC9/TCF25diHvLH1B2CX6KOH3dCkahsa6MnG8JoWbvQ8mUpnpjGSoue83EizpMZpHkf6saybAGXlNrUef5DkTpfZEKDJdD0XWbpMryMuJeHlrgbh1hLc7EfkrpEULwi6EIjbpe7n2/cRRLnKr6tBJbeA6toZ10y5LTXfMqkXRjsACCVppe9G4lIxVVMiEV8f2sjFP9+9NfM2i1200AZVdgCzjurrrur6TW/8Ifo1SMYSsK66ODZ6tJEu/S0BMSrKxieSm7Z5c+R+gDhEEKzHAnMk3C2Z1l/u+DW58P2dC6j7zbncFgjHcGJDosYbqtW3Pc41ZP0eQFzNElowezAc3mF1uI0UcnLTGPifltibsUr91NPyhR9JhnGKO37+3k1LeVncxDxBN6zMVcLSGl+H83pF5CO/Y8bN+K+EWSauJZ4ptU9zwiQFyoqMhDyoBiZzQ4iAnetQzoQM4nR2MgGZV2k59xWnDyUy/33W3KNzhDrG/JQxio+r6RDDDsfSgzjUC8QspdywsHzGhpLMe5eMH40sut2y0ov8bYE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261009223027099003)(261102123227099003)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YqsBxWjSRpHgYmJD7nndktycnmozZ3T2oyZAGK66z7TidillZ6BLGkQyzWjy?=
 =?us-ascii?Q?ZOHPnNFgJ6JGEoVkIxi7WWIfFuHclkfzJslLvvsH9uS8HKpoxuaHRMXNzm7x?=
 =?us-ascii?Q?rrSvhmDyj1h/voTLvVI2Cgf/e8zigyLu+8cwS6qCzhOw/zU4s7DT0buSwoVk?=
 =?us-ascii?Q?/f5aSyIOVOgEvVdamheGGBlboebXVFpnhRMsO53NtJpaa+IcyEDcCNZ1meSh?=
 =?us-ascii?Q?HuzTB5s+NF3kcLA1vBl3zZRm57Sz6kdtrM9qztqeM/Ho/7M3+SjsA6erPUOa?=
 =?us-ascii?Q?6JFgSRyr+g5RTHnOtmtpTdmkZEveluJXl6nrY9OnyukNzC1bukEr+Ec6aJt8?=
 =?us-ascii?Q?bDxsHrvWJDbT5X9Q7IW37S02FE3GFwuesHFWhck1RgNFqdW99HTn6T1em9qX?=
 =?us-ascii?Q?mjptbU0d2bIu/J+A6wgKmfv0DHaFBaZUq2r/2jJBXKCHJuSmA1yxOojl/s95?=
 =?us-ascii?Q?KEiKtCqwO86nJvu/p1oK2JPEThOewBv43Lj+yr7CaZOOw7MSwU1S2YSM8Nph?=
 =?us-ascii?Q?J/AQuuvwEVriJtmfqvWK3k+29WUbjwlr1zWfcHlOmYTkx1Hw3mV45Lc+Jej2?=
 =?us-ascii?Q?WWE1pbbrx4a0CltUVGmtBdIKc2lxpogfegfc5DIscJKVTHz88tBTa3K44TLR?=
 =?us-ascii?Q?8IRyYIjzuJoCb4Do87Khukxg1C17ZZj8kqzkV5vRizBBHVC6bPWQDCAkQZzi?=
 =?us-ascii?Q?pKmnzCVjl6trh2EimXwn1xCRSXkKS3sqeVhBD/yWAqmNT5rPsHHoq4LjxFyJ?=
 =?us-ascii?Q?cdf8jbnHDaYy6EmjxcqOmFJFJ80B27WIhUwjJMc1pW8hTG9EmmllJUKOOLfk?=
 =?us-ascii?Q?3hzYLVqFNTi3HvqQxy/C7dsCf/8d6D0BmixQgjH3F2b3U2RZsPIIOSxRSLNB?=
 =?us-ascii?Q?tJ8rmI1tuRDujN3Juj3PkizSkTRa64qJ4A3w1fAs6oOSg2QKYfq/KlO4Q+Ar?=
 =?us-ascii?Q?YW+pOgKTkx0rtt9NLoxVeI0iO8CpRYXPD3+GWSBAZLz0FfUxmm6WTRImbw4B?=
 =?us-ascii?Q?pahT9WVKu+zkL4SGaPiYP7W+6CSWxZvK0Ota7TDTyc0/rnmAOJFzoP2X3gEK?=
 =?us-ascii?Q?qmgpFpCE9WrsmosA0Yi3pjSpPD6qYuLCUb3uhMOB2yIQEmmBDZWRsfhdrQBy?=
 =?us-ascii?Q?8cG3+iNOvFYF0m3JJQrzaqax52wv3f+5VbFPkTtZswBMK18fqMk8kXGhg1Ut?=
 =?us-ascii?Q?Zl7aAoG+rzYvX86kPs2Nu+AQUQOByyxrNz1IIeaD5jynAunW2C8uddyIPK9m?=
 =?us-ascii?Q?+B8Ie3ncjmwRvFyJVexqpFJrIWSB2VXwudz7raQb/S958Epkizm7MrJrd9L9?=
 =?us-ascii?Q?ukk4bygU/+3THpIlFuUfCMZpINH2C3Hjdrrz3xrc7czkjNb41Eaj4sIV4xdB?=
 =?us-ascii?Q?Ym1F4emsNVlWuIXkzZezMip0hErOsM9b08DIP5rJTYpW3LXcOLBcvqBAYDxK?=
 =?us-ascii?Q?2tJbb6tFOUc+qeQ20SvHBns7i4YFM1P1kZVJUQ5ZwSM/w1jy8PdndEdIkMnt?=
 =?us-ascii?Q?6RsoXcRrsLAwtBeMK2MnIIdmL62M3NUInAVFcOcJxknhgIHmiCEhPKvL73zY?=
 =?us-ascii?Q?xA51PS3bGZ3BYtXQBJuTXsCgxKNF3Tx9KyojPz6TdN7T6499+FnKL8FHrqhK?=
 =?us-ascii?Q?dxq+dZRGvbkRxkqoHmPRyqzf+gcLP6bb+5UUfjHZGXB26h/fCBb8o8iugtRO?=
 =?us-ascii?Q?yTbAJdnAeUBLLdIq82tCUKc+AbMN2CWyndGUE73fUbq0O5lc2Y+vadgR1y2V?=
 =?us-ascii?Q?IhNo4siHUmDyXEwpBQNCBIl0JuhIwQ5wiI0AvYbXA08a1SMWJHuu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8125fc95-a116-4e3b-3c79-08df41c418a9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 20:24:19.3718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkzRatBMyUgVmlSOwG5yOvqCevimpZBP9REI8D0rK6wkgZgQmr4AYNzmEAwwH7XEFacRasR7ThhwLLkehmtOWqFfP0pUcPXI/XwwHUBBAomxj2uoaVLnvT8JOcuY6s9c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11589

On Fri, Oct 23, 2026 at 05:38:27PM -0600, James Hilliard wrote:
> The driver has no device_synchronize callback. dmaengine_terminate_sync()
> therefore returns after stopping the channel without waiting for the
> virtual-channel tasklet. That tasklet may already have removed completed
> descriptors from the shared list and be executing their callbacks. For
> example, serial8250_release_dma() frees the RX buffer and unmaps the TX
> buffer immediately after terminate_sync(), while those callbacks can
> still access them.
>
> Use vchan_dma_synchronize() for device_synchronize. Channel termination
> excludes the interrupt handler and allocator before detaching the channel,
> so they cannot schedule another completion for that transfer. Also stop
> the channel and synchronize when freeing its resources.
>
> Keep terminated cyclic descriptors on desc_terminated until synchronization
> finishes. vchan_complete() may retain that descriptor outside vc.lock.
> Ordinary active descriptors have not published a callback and can still be
> freed by terminate_all(). This avoids accumulating descriptors on each
> 8250 partial-RX flush, which uses the atomic termination API.
>
> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/sun6i-dma.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 25987f550707..b83138745bd1 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -999,12 +999,20 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
>  	if (pchan && pchan->desc) {
>  		struct virt_dma_desc *vd = &pchan->desc->vd;
>
> -		vchan_terminate_vdesc(vd);
> +		/* A cyclic callback may still hold this descriptor outside vc.lock. */
> +		if (vchan->cyclic)
> +			vchan_terminate_vdesc(vd);
> +		else
> +			list_add_tail(&vd->node, &head);
>  	}
>
>  	vchan->cyclic = false;
>  	vchan->paused = false;
> -	vchan_get_all_descriptors(&vchan->vc, &head);
> +	/* Leave terminated cyclic descriptors for the sleepable synchronize. */
> +	list_splice_tail_init(&vchan->vc.desc_allocated, &head);
> +	list_splice_tail_init(&vchan->vc.desc_submitted, &head);
> +	list_splice_tail_init(&vchan->vc.desc_issued, &head);
> +	list_splice_tail_init(&vchan->vc.desc_completed, &head);
>
>  	if (pchan) {
>  		writel(DMA_CHAN_ENABLE_STOP, pchan->base + DMA_CHAN_ENABLE);
> @@ -1103,14 +1111,10 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
>
>  static void sun6i_dma_free_chan_resources(struct dma_chan *chan)
>  {
> -	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
>  	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&sdev->lock, flags);
> -	list_del_init(&vchan->node);
> -	spin_unlock_irqrestore(&sdev->lock, flags);
>
> +	sun6i_dma_terminate_all(chan);
> +	vchan_dma_synchronize(chan);
>  	vchan_free_chan_resources(&vchan->vc);
>  }
>
> @@ -1483,6 +1487,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
>  	sdc->slave.device_pause			= sun6i_dma_pause;
>  	sdc->slave.device_resume		= sun6i_dma_resume;
>  	sdc->slave.device_terminate_all		= sun6i_dma_terminate_all;
> +	sdc->slave.device_synchronize		= vchan_dma_synchronize;
>  	sdc->slave.src_addr_widths		= sdc->cfg->src_addr_widths;
>  	sdc->slave.dst_addr_widths		= sdc->cfg->dst_addr_widths;
>  	sdc->slave.directions			= BIT(DMA_DEV_TO_MEM) |
>
> --
> 2.53.0
>
