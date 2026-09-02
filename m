Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011012.outbound.protection.outlook.com [52.101.70.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C731472071;
	Wed,  2 Sep 2026 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360167; cv=fail; b=Xt0LvwlhRkJun8I9B0el6yu+tLGys8Tvy0uI8U+KdhbvrOsmux40GAeGcZ89aG2Bx1xem/rn1JnhndNW1y8j9gTTdDUet20lyKBk5S3cw26XDGHT3C+iUXbApUSii98Yhp0qvdti8BBSofEj4HaNdt8tBXdhmnLEhq+1PC42v7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360167; c=relaxed/simple;
	bh=K7JmAtv0/Bw6GvtFoikbfngJOsZhDSmI1CoSONJ+l5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SeuHfPRjw/e3FHTqH9zx4Hk5JxvC0hfeNZgxuSwYG868I5o/A0gH4+EkdJEZxji4mEwvJETaV48OZkd8uWbdtAbIyVgElTRjIIWaMeN8OK5gvxGHv3vfY8+YK2DSZ59vrNt25mspqmFrrR/59HLIY01MPyXtWcl2MqNw/TS8h3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vWt/Rt2n; arc=fail smtp.client-ip=52.101.70.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vWt/Rt2n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUlnHnUWBZLvLMovX5BjHOpFFptDNT+d+ti7whhFjqoZj91oDxDXYn39YSvlH2yGLQwmgFdFjCLra741K1FEEj5ASEhD58F8BB1vFweEFM89SrjURxFQBZmstN+wj7K1ghe6Yt+TfcV1acviZDtS7mTzGEwPl8ngn/pppWiSuzYoGmmTTh4kJiEHpul72D6C3eWgON47Ye8GfD9teqjCWSWqE3N1KN3SzWKsVsMPryIYEDv4RJwFmjqUnUt2jHUG4UuTFlP7obx1sZmE4ExPfa4WWYQ8945cDqJzs79X3ay+Ltza+g40ztLpbMGFj6q+6HO345zyWg5+RkYizkUl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rBB8U8QrMoQxvA5/PBQQC+lbeCs6OLKZtcN83+RtBU=;
 b=Yb93kFlI/nOtX/QeKMYnyXINVp48SCQWrgdWqLJBT+usvbxfBEJw/J8SgJmNd+871sxH59HwhrdqKmrlAQnidkE0HCG1I3u6TTmSU3AkqifrEke0Pm+n8WpbUoagTEb4WQ4T14z2tjUr627p3YKR3K/0hqj/UA1WaxX3vyCrspo49bmTCdttoVJDgZQeucrzcnu3vW21h1//OH/83RdseOxTDfJcpQ49sVhDgKxKH8l0nq4unwGnmdcaSg2XzxZaznxNfw/7RDhPDup844AJjkaxMYKPq4mmYx48CAyXdXJBfJsXaaMhoeHyLFiIdQLThPiwzTBRTPImQiSA8KKNHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rBB8U8QrMoQxvA5/PBQQC+lbeCs6OLKZtcN83+RtBU=;
 b=vWt/Rt2n+p7tOdJpvVu278kOCUvJOYjbOm2EHS6GLQJy51r4o72sE2htOpO91ckkjEFQFFoMOgzCscjVq/4qkDCOhc8Nlg5qRmUmfmYUi3JawS+KkBhIM1dhuD8LTmVkSPIm5LafYvPHiSvBoDbtLMDy3HEu3qQ/3rmv27OpR8GOntoevr4WcWU8VG17uc7PJWxI35WzYj/OLpxQwtjaUmKguVyFBGQNbgC1LDPAYpdfIesTHSqYlWCp8FzSNYXZ8i01fMUybN7fKGFkmVvcsgqdQQQLaMV4+Zxf9Zv08OyoQ2biW3ymnsTI6dx9jcgnBhdzl6zWm0+DQo45l5WmYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR0PR04MB387970.eurprd04.prod.outlook.com (2603:10a6:2c8:35::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 2 Sep 2026
 14:42:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 14:42:40 +0000
Date: Wed, 2 Sep 2026 10:42:33 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v3 12/34] dmaengine: mv_xor: convert irq tasklet to
 dmaengine BH
Message-ID: <apg12Y0MxVtVbhnw@lizhi-Precision-Tower-5810>
References: <cover.1785183549.git.allen.lkml@gmail.com>
 <cover.1786384168.git.allen.lkml@gmail.com>
 <75cb0e6cfddfcf5655fae89f58a06cdeca02f831.1786384168.git.allen.lkml@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75cb0e6cfddfcf5655fae89f58a06cdeca02f831.1786384168.git.allen.lkml@gmail.com>
X-ClientProxiedBy: CYZPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:930:89::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR0PR04MB387970:EE_
X-MS-Office365-Filtering-Correlation-Id: 075b001d-7fd5-4e4d-3907-08df09007094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|56012099006|18002099003|22082099003|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	PoWSA4Ua4nl8qZ8VtQ/OvuHgv+IGxBlRYx+6avMXgHNyVx9T0gie4Gr0CUOFJHJVQDevLCdum0bPKh1UnFIjrzHPAbyroby2+DeEkHtf3CrxK3tUQ0rLEvKqMbyeNBhU1Qhjgc08Hol/2rulqzOrA8S6UCFGp3HNv+huQemAJ/7Fu32XzJvaFfV3IzfdmMYBOfuGOiqPRZrGraJxgOAsY/twSGZsBfEksHPCZt9E0KIYcbot6fTLU2FZTy+tL9G90VMeZ8adF2+etepMiavCOBoYlvqWsnmgaNSOQu3oy4sxMiQ2ToH4UXDavyGRF9OK9ewgnGluZ833Yf8cS9iE8aJLb9FcMJeb6R7qxGF8n4HycvEZ0P0nbREN5XFvsO3Lz3i1tIHoXbhItX3MiRADaYUhItz51ByvzHssRlfX1UafJFuB6CG4imBP1nDYpA37ju/Zi4ytyZ+PL9o26IwBGI/WWPC8RRe5C+MDNRiLSVyeE0lfPQ7qEudQ9WXL10reACHAv35Dh3HTZbDdTNV50UCqs+YFDhQ2hDzDgvUNJFTAvITBEXHiw6uYonvauu7F6FA9glSASHKKGv5ImqTTFRZ0ryelG36gkl8+nauxElek0nK5LxqT6BU8wdoGR7iOhuJXIJHHBQ1eTH/990Nz/EkJgvXfVf21fbfF1OJ5wNM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(56012099006)(18002099003)(22082099003)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6GA/nC3wht9i/QmUmrMgIwjWJaSSarX1XZtmVYwaZlR9dYbZ+o8WyBx5KNH6?=
 =?us-ascii?Q?aplQXC12D6rznIbsEmB5tLfX6Adu4w1Fbhjq9SqBMQfWaAK8yxeXVueN264Z?=
 =?us-ascii?Q?+yUKIjJ0PXHdBDn4R/Sw+EdWJ6sxAlQ8VC7cVKBiK0lSbGm8pn5bZtC6UTin?=
 =?us-ascii?Q?SdQKNNoQyakawicuotj6VFOx0HHXmD35I4zz54hmqad12ZOzxsEx2QyBnPam?=
 =?us-ascii?Q?YsG3059BQeajaPnbJkU5RjELgCC7706oLemK5EGB2Og5Njwk9q0xu01bII/+?=
 =?us-ascii?Q?q9SQqbbxaZoZT9EhxGeO1AJalaouu6GgJquLKrPb0ZmCPtmFo7Uu38s0lr47?=
 =?us-ascii?Q?WDxVftsZ2TVHhpwdnIQYfAqsXmqPn3NUxUT1pb+wEOMo6rDJDbWjLpKDtRkz?=
 =?us-ascii?Q?G9VLFm91pDkIoPqGXzHs0XJN3M48/xsnBAGQSScKa/MH3052GG13PMO6OKQZ?=
 =?us-ascii?Q?IWjM7Wxxn2W5vyai2WCGaHowEDE0nR0a+Fbj5r7CuvRsnzl2sYfxMP11wYtZ?=
 =?us-ascii?Q?bpgu74B9SPJfNIks2wHFjA0AkFZyJNGbFUER9Q7JqIJS0+dN9C/pnJnKHmK/?=
 =?us-ascii?Q?GYphYh4p77V04JCbAv8Dw9EL2Cni5ttXfnoW4Kj6uhYKxmp+sUQNADKMQPb8?=
 =?us-ascii?Q?WGTAkvO/J7E4/CCIvzxopeZgwgP7mGLIZEpJH2OogkWT1NU+S604beeTbOoh?=
 =?us-ascii?Q?XvTzW+HkPdzBUK+vfNqccV5twWOO4iyLY6Wj84eX2WIlCa4n58sfxNoDSL4+?=
 =?us-ascii?Q?5W73/H7ayYYDQEy5GgkVPx8rCH9KPJcBmZiPhb1rpb7eGCqd+ZJppNkAdAKq?=
 =?us-ascii?Q?fIKf3DHA7I7QsulBNM/LWrAkFjo+nTP19dFoz5137l7ejmjri5U7jJ7gmSLl?=
 =?us-ascii?Q?8mJamQrOUA5fushRKZpZWxSALUGUNA05Cio/Gv7j4G4Dr5kJ9C7iHD/3Q5Lu?=
 =?us-ascii?Q?lSNgyGe77IdtJctf1E2hwo7MdeNC7F43JkR1BdcFy0LMC+d2H3dGQah99Fj3?=
 =?us-ascii?Q?jGhmJshB0rpwhcCGe45eyip1xnHZIOiJRfjacCqEGAvbsHWJoenve9PrLfbz?=
 =?us-ascii?Q?6AufZd4tyn9gT1PFB/bD2BjWIGBJIg9S7B7jnulSUFEJ7ACpTw4SBacZyoUC?=
 =?us-ascii?Q?Te6wr2vxiJK+g6vRlRfpnUAHPF1ov0ATMcqaRjs+ZJHME0Im6HE1q/cfyRkl?=
 =?us-ascii?Q?msIhmuB7H2Vc5bxX8Ew4ea3neQ5dFAGBeEMIbs+fCRE6PO8RjEaefwElcL59?=
 =?us-ascii?Q?juxJGji/xaW9YwmlPaHyPgkFpXEcP/SS1HLgFohe3nciegaGqAL6wqCKDX/S?=
 =?us-ascii?Q?cu+iPbTLtLIilKjUNkCnUHoELbzGaRF0OsXqje1PE1WjxMuLSa1o0bM9yYRP?=
 =?us-ascii?Q?ce93JF+gxIKoFh1ixO/02Q7FShCL2NOxqUycwPwxj+oa0tGect4BcH07SuLD?=
 =?us-ascii?Q?HWOpblu2PKki1rxSTszOn/94IxWrufTbQhOhGM3DOftixaq9kbYW4toMDWD2?=
 =?us-ascii?Q?hzFrgvPjoc7K+N1W+5q2LpHvfItSiWHJYvBi9hS0NhyKG+bLPw0DwglMfw9h?=
 =?us-ascii?Q?Ui13OSzA2sQoT8dhetw+hobdvXnOCSEAULBjI4VMcIP/MNbfcCX98cT8/VvI?=
 =?us-ascii?Q?WhNfDfnjERmLZn9KaZZLRDIj2OUf7m4IaqpWF9pBwp4EZXtGwHF7vmPkPN9G?=
 =?us-ascii?Q?MsoQbzlxnBt3/8zH3kusCBWO7bFBNGL0QRuNy6NkfF45HYewtiwEEVOW7bbN?=
 =?us-ascii?Q?fGtwdpbYQLbz5D4ffdFUbkqY0wDGPJ0c18mgTWuoSiMgjhiFIqVH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 075b001d-7fd5-4e4d-3907-08df09007094
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 14:42:40.6928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXZrQFk5/DOHE4su0np6jSh6bPvEvgAu+oMlbzUofPB+JlxSXvZmG29tLgkFgm0m2HwbpJJfeKW+SsiRPlUxnUTzNI9LLHklPVPcRiH4DkzngqRM4Xs5Tmil+y/bzfK1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB387970

On Mon, Aug 10, 2026 at 11:09:13AM -0700, Allen Pais wrote:
> Replace the per-channel tasklet with the shared dmaengine BH helper.
> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/mv_xor.c | 12 ++++++------
>  drivers/dma/mv_xor.h |  2 --
>  2 files changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> index 25ed61f1b089..752e30ca5fa8 100644
> --- a/drivers/dma/mv_xor.c
> +++ b/drivers/dma/mv_xor.c
> @@ -327,7 +327,7 @@ static void mv_chan_slot_cleanup(struct mv_xor_chan *mv_chan)
>  				 * some descriptors are still waiting
>  				 * to be cleaned
>  				 */
> -				tasklet_schedule(&mv_chan->irq_tasklet);
> +				dmaengine_schedule_bh(&mv_chan->dmachan);
>  			}
>  		}
>  	}
> @@ -336,9 +336,9 @@ static void mv_chan_slot_cleanup(struct mv_xor_chan *mv_chan)
>  		mv_chan->dmachan.completed_cookie = cookie;
>  }
>
> -static void mv_xor_tasklet(struct tasklet_struct *t)
> +static void mv_xor_tasklet(struct dma_chan *c)
>  {
> -	struct mv_xor_chan *chan = from_tasklet(chan, t, irq_tasklet);
> +	struct mv_xor_chan *chan = to_mv_xor_chan(c);
>
>  	spin_lock(&chan->lock);
>  	mv_chan_slot_cleanup(chan);
> @@ -372,7 +372,7 @@ mv_chan_alloc_slot(struct mv_xor_chan *mv_chan)
>  	spin_unlock_bh(&mv_chan->lock);
>
>  	/* try to free some slots if the allocation fails */
> -	tasklet_schedule(&mv_chan->irq_tasklet);
> +	dmaengine_schedule_bh(&mv_chan->dmachan);
>
>  	return NULL;
>  }
> @@ -737,7 +737,7 @@ static irqreturn_t mv_xor_interrupt_handler(int irq, void *data)
>  	if (intr_cause & XOR_INTR_ERRORS)
>  		mv_chan_err_interrupt_handler(chan, intr_cause);
>
> -	tasklet_schedule(&chan->irq_tasklet);
> +	dmaengine_schedule_bh(&chan->dmachan);
>
>  	mv_chan_clear_eoc_cause(chan);
>
> @@ -1107,7 +1107,7 @@ mv_xor_channel_add(struct mv_xor_device *xordev,
>
>  	mv_chan->mmr_base = xordev->xor_base;
>  	mv_chan->mmr_high_base = xordev->xor_high_base;
> -	tasklet_setup(&mv_chan->irq_tasklet, mv_xor_tasklet);
> +	dmaengine_init_bh(&mv_chan->dmachan, mv_xor_tasklet);
>
>  	/* clear errors before enabling interrupts */
>  	mv_chan_clear_err_status(mv_chan);
> diff --git a/drivers/dma/mv_xor.h b/drivers/dma/mv_xor.h
> index c87cefd38a07..27774abe34a6 100644
> --- a/drivers/dma/mv_xor.h
> +++ b/drivers/dma/mv_xor.h
> @@ -98,7 +98,6 @@ struct mv_xor_device {
>   * @device: parent device
>   * @common: common dmaengine channel object members
>   * @slots_allocated: records the actual size of the descriptor slot pool
> - * @irq_tasklet: bottom half where mv_xor_slot_cleanup runs
>   * @op_in_desc: new mode of driver, each op is written to descriptor.
>   */
>  struct mv_xor_chan {
> @@ -118,7 +117,6 @@ struct mv_xor_chan {
>  	struct dma_device	dmadev;
>  	struct dma_chan		dmachan;
>  	int			slots_allocated;
> -	struct tasklet_struct	irq_tasklet;
>  	int                     op_in_desc;
>  	char			dummy_src[MV_XOR_MIN_BYTE_COUNT];
>  	char			dummy_dst[MV_XOR_MIN_BYTE_COUNT];
> --
> 2.43.0
>
