Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.69.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793117597;
	b=Ed1U5kuazj3ZgM/UrITBxTOKrBLLqQgQTitqLgW35MzLzCUxe50uU2jwwAkQW/Or9oxV
	 cY4/CF/AXPAWNYsqP+A0X4ilC7hPRqJnegD3gorxaP+6oKqlVje70yEdRUsSM1cLKO7pQ
	 QO56HsCrqBrTbwqQarkD7DD8t5Dk4z2HUYoe0s5e4suavNHQ6I/eUyJ3XB2Bez8PRvJt4
	 7mnTZECDuCLAw+qXsddffIl7kkRSqUNVcb6gVffKhhKipYGt5YX/tnQqkRoTokfWbP1Zs
	 qFp67H7097gTmGvZzdiXDgoO6cx3hlVnp3RtO/1PeMB0Lr9291DxIY/xqeHTB3UBzFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117597;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=1uW9xDH348jK7VwTY0TasEcE178OFVufuNih435u6Cw=;
	b=v4fPlv8YRcuqNJIr/SsIrTPhNw42VmF1CrwK97n5yFYb5HpvtgFpq2HnPxjYQpFZ8bxw
	 ac3NfpdFf/DXFUpCPIt+QzXU+JWglQ9lPwAuuvB8HtUu+nsDARXcFXNOsRlp4A4NKOZYu
	 wqnTPKDdwymtBPFu5y0awNiGX10c44nCmLxBzIV9hAXDO1EzPzO54ydtndh2Z5gCmPD5a
	 oNNBEMdsrbCMMHQp6CIoHkBaPr2KzHM60/ch2pKCX78hHVy1OmaD37mJnbJ9u5AHLzL9+
	 35Yuez1ek0r9f0ZZhWe//+q8bJrr0O8YZ9oZrl1DI7UTlKGE0C7j45drBfR7+nQPXQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dsSd2jys;
	arc=fail smtp.remote-ip=52.101.69.6
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010006.outbound.protection.outlook.com [52.101.69.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AD8606A31A
	for <dmaengine@vger.kernel.org>; Tue, 27 Oct 2026 16:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3AD8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dsSd2jys
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwKRPpmNPEc9RENmDp8u/RXvK/JoKi9YXBpoFaVjbLc1H29dLFagkE4JXl7sG9hA0X/Shi9mUVP94pMZQ2J1rcUSgBpsT066X46zXUr5OIourcxO30gTag8aD35tKODG5yNQTJS/5uLtNuko9wFk59UMMPErq5tLTKiot0vDacwH+hSzzVOb1wxgSp+nYH6eFDio3uuB82p9lgAl+5vS1JufMf329G7wJ2jw4cGMjZccaaGqtkJiRBwCAG4MKP0/AXe1j3QfyfUwhWrylR9xgtPiROtiUWC41Bv0AIfhmcuz+stLaNsfEz3UPKTOmDK5RcrsZXWwt9xLMGDyqUBbug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIjE1UDYBTGhOD7XNr70rEnV6hK7crsN0hvErjQwI0Q=;
 b=fsAIyJ8T1e9BxBHKkmneE9C63BgJVNYWSZ9xtm94xPdANFEHMeEfo9wozDf1a3lBJC9TzBX87qnYCEY1rmUfDUpc7FmVxH3mrCbRFDcsIPZ3KVl4wDcppxaTD17/cJexDFWzpnR2E9oUNfb/uWINXjSbf2SV9OprQfimkxMV+/rG4lY5RZumq1NVkoKFo1sSRCIS5KBn2SvY2w7DoI9/qz6QCj829GXWRwsIf2eA5bII8i5VDLQzcV5F6VSzBS1JMlcBI+bZ4Fnzp5AbqPEdDRKqQDLaSCkXUrOGxD70+Bk7I9wmBKihZVpqGvPliHW7mNuhHf1jhyD0Ig0oE9GovQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIjE1UDYBTGhOD7XNr70rEnV6hK7crsN0hvErjQwI0Q=;
 b=dsSd2jysjK/rOsRSAgHIofiSs+dszXwiR0oXoCeRdRfR61NHezSeJ2L76B82sDNcvS7u5ysOJjrB4tMsS4LyoGKIEbRpYbwYsFwA1/AdEmG9wXGHkMTkC9XHTZtmKejCtnJCCmhnzwh6vTPeJltU+/D0vXDcZfmoRwrP/xRGNHm/jR7luYC/jBOiHtNoiMErzogN0c1kiJr5SXTNpakZvXQtQQxrDhRufF/yfCwZydp4qyewr63gDLAzCylrYxcsO+SpMyWXyAvn0TL7OiRaf6xhuUF4cVUYdD7/3Pr2i4pa9igPZ/U3CjNKAkt4QNUgeaD+7weEHk+f8sIhLT/00A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MMZPR04MB900905.eurprd04.prod.outlook.com (2603:10a6:190:50::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 16:13:12 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 16:13:12 +0000
Date: Tue, 27 Oct 2026 12:13:05 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: James Hilliard <james.hilliard1@gmail.com>, dmaengine@vger.kernel.org,
	vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH] dmaengine: dw: synchronize completion callbacks
Message-ID: <auDNkfOAqm0QJK6v@lizhi-Precision-Tower-5810>
References: <20261021-submit-dw-dma-synchronize-v1-v1-1-6af85c2d6f69@gmail.com>
 <sashiko-outbox-180707@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-180707@kernel.org>
X-ClientProxiedBy: PH8PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MMZPR04MB900905:EE_
X-MS-Office365-Filtering-Correlation-Id: b3bd61cc-6fd2-4b36-fea3-08df344532d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|23010399003|261026140227099003|10067099003|4143699003|11063799006|261009223027099003|56012099006|261022105027099003|261022075727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5NiU3TMB7W6brHf2pn1fEEmRBBehdTutGqsOm8MGIIXMhCjNZ4B2iXnYeq7LFl9Vxs02ZyUNPVAojjSbYSiXkbaLLU7eJz5kqi8sRNc70HjaGxTDEzXHC6LmTcjIimOOIlqeyKLCTRKT0skcvx/1l6Y/SgJ9XyseS68vCIt7bEDpXlyJKfrYD3HYqZUbZKyaT9N0agKJMGJqfSxMWzLsn1qE+GXQnJK8wmhfvL1qB0wWhDxYtk4gGtNkqM+dmCcAiWx76dqJ6tgNVzamdG5OHCeAR9BJWKMrI9TIFSM2JkqZHKe+nIZn6p6bmnzrsJz1dsiBAeDOej/MYegkiof+qn11/1PzLy/UFBRmnV5wqLHvl0Z0YBWz1B6Ed+8KoXvsEMzqRZVFv4cxITGArs5pwtTFFvm676N7z366iYWbxSCkp/pmLc1EfCtEzWC3O9PHBAhGcb3qaOIkCwGEhTes8FOV8OmSKViZW6TMyv0SCHI5INO0IQQuzQSw3x/8ZMekWyIfaegSAtcXmVNzyxLsLjCgRZDxEojYgTRABru28fub2Dzb5NuZ4swfpSXIdFL9iMK6uASZmh2hNEKG2a01+AiGMMRoPakP93KJbxZboHw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(23010399003)(261026140227099003)(10067099003)(4143699003)(11063799006)(261009223027099003)(56012099006)(261022105027099003)(261022075727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?X0O5KbV9x0TWBZCw7c/ym6k1gWlff0H0XXrbiE+D5NI09uYVhalYTM+b02?=
 =?iso-8859-1?Q?UeNhjYnTxOIPViG31D2cmav03HMgd55EyeCXalSk8LtFfktc0IO9UOawr7?=
 =?iso-8859-1?Q?lC4QbjZ/USH3T7ncr01woiu7getsmQ3bqSGU4ijs9l7YYiPJ2TOu9ocKG5?=
 =?iso-8859-1?Q?nf2wB3KG+PYIuFuJjwDJklND91+j0MyKPpj/KyciRoqMnEGntvmE2vP4JG?=
 =?iso-8859-1?Q?r2HJw1lAZFD+XnGjsL8IwDH8J7Dhn/pt/VKhT0gxPowQYm0JEjTD39bLsh?=
 =?iso-8859-1?Q?J0/G4gmFuZUvEurrBgE7iQGnWPxxnN2a/pIGKKx081gSZ6D8E38O0JT4Fu?=
 =?iso-8859-1?Q?sRDEVv9FKSJapxuccwoIigs/i3+eIBFDr7LzMgGo0IXfQTryKD2BLGvIgM?=
 =?iso-8859-1?Q?i/qNCmI9atOCLEeLJ0C+MaBllm+q77K/eIxlWQ4/HrtenAg1/ieVp7SfHh?=
 =?iso-8859-1?Q?T99MSs0lzNVlyhA314fcbTsb+MMW+eRd0U1Q1o+JCccizSXmWZzEeuZYks?=
 =?iso-8859-1?Q?a9ww0ZU0qccREJFvh6BbaCPYLRv6xTvDDP5d/ffD1+D0U/kFCTM1s8LCmL?=
 =?iso-8859-1?Q?UMQO++sL4x6SHx1S1gXA5phAEANwzP5yNjjilioVMNNbix+g2Oef7KFCOL?=
 =?iso-8859-1?Q?odY/WmuueVo8MV5KI20dfNyzCuSSerEMKL6xMjjgEEDA3clTsEe7erjes3?=
 =?iso-8859-1?Q?9qpLnxND7GagSwh5tUcX3gQgtYMX/ZO8J/KvhMlEtzWa1fTv6K2e8nRCD3?=
 =?iso-8859-1?Q?upp+6krExwEBba1ECHsk9UP7K3wEbWVzTIR5JBd7+6Obk48wZGH2hJ3KjU?=
 =?iso-8859-1?Q?2syazsDp06c9Akyz/1Ef90uT9MMiAsZQ4+zonQcemC0fT9oIOWQ3xvJKvF?=
 =?iso-8859-1?Q?KKipUV7Es94CRPLLQxgmheEIjYvg3vxPV7490GSJ1d0ql1ySGYp/rWAqEb?=
 =?iso-8859-1?Q?WAjv7G23VcIZoJ2Z6pyNmJGRREmso2A8HfE6dO6s9BOzZmXWeEjwaZJhpu?=
 =?iso-8859-1?Q?rsRmyGZoNc0fc1x/I/2VK9xmaWCbERLZeT129PlxzOn1KiU1jU5zpT2ILW?=
 =?iso-8859-1?Q?NuP4QIT9pFjGibDVXSGp/oiX0unGAKSGfyWC67KleKTvW6s5ey/E3rOKX1?=
 =?iso-8859-1?Q?eyhF5zhM15N7EmDr/iuxjgwBwzr7A/BGE7J90IBP7ILHnKTSulu6BKhkis?=
 =?iso-8859-1?Q?Voa7bi7CJGsgvRbUASgMCFNBDINuirmm8hJn7QF2l18NcpXjkG5x+rST7t?=
 =?iso-8859-1?Q?On1Sondfr1t1xdKDe80Wb5zrOIAFZGJG/9xqqXOxRtoiyHJ654I6jumFBW?=
 =?iso-8859-1?Q?EYWKcoljTzAbViJZpN/0z6fzwUpKXAONGrQN0PRdbl5cou2Q0XhsJjxpsP?=
 =?iso-8859-1?Q?t+g36n0bv7/WaUMKR+9/6hinYwq6b5bs2AYIb1cWRv1TIMZEvrRKohRQr2?=
 =?iso-8859-1?Q?P/L82cR9Y7OQ9C1SGs/rPccuxzU/fX14Ezoa6ogeP/3HHl+colv6Nq+txD?=
 =?iso-8859-1?Q?+oGOMGmrPHJb2UMNNTqfvTVMuDCF6oUMNZ5P+ibkq2MSMheBjzdqJIHdHD?=
 =?iso-8859-1?Q?+TBoRrpo+tTUjhNGL/LxsEATp5azPW8Gl5+T3ip9sC5hX2HDlsEpLo1r3U?=
 =?iso-8859-1?Q?Sew9JpLp5o/8S7d95O8O0h4FSpwwL2Mw7syerVicuh2flzjfMVjp35C0wW?=
 =?iso-8859-1?Q?6FMPg2f5ApmiZTcCMV3Hocrm4W8jsH56rES9fpsTV0CNk56IlDfiU3Xozs?=
 =?iso-8859-1?Q?nk7uQTWT1QR1JaVmtyrXxax1MEdK9P9T29252A5lunihPGdCuXYl8MpMYk?=
 =?iso-8859-1?Q?pePOHRLUBNem3X+y0wd15kDkFDq2/3UdUECbl4QpYiArjWsNon6R?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3bd61cc-6fd2-4b36-fea3-08df344532d0
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 16:13:12.0594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbNIWmFVmwmQM5XFjUYZ6u6D7uyXRJE59d0lD/oualthkemfwukAh8NJvjUyaXg1Vphs9J/96YN1RgjKlSUxr4gJ9awmwo2+FTXqe2Gs5wZjZzYwqEASTgPhZGQJZy6s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB900905

On Wed, Oct 21, 2026 at 09:31:42PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] dmaengine: dw: tasklet_kill() in dwc_synchronize() drops shared tasklet runs
> --
>
> commit 095fd30b59df2969f093996b0e32af6cace0812f
> Author: James Hilliard <james.hilliard1@gmail.com>
>
> dmaengine: dw: synchronize completion callbacks
>
> This commit implements the device_synchronize callback for the DesignWare DMA
> controller by calling tasklet_kill() on the shared controller tasklet to wait
> for in-flight completion callbacks.
>
> > diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
> > index dd75f97a33b3d..eb3f5ce471a22 100644
> > --- a/drivers/dma/dw/core.c
> > +++ b/drivers/dma/dw/core.c
> > @@ -965,6 +965,14 @@ static int dwc_terminate_all(struct dma_chan *chan)
> >  	return 0;
> >  }
> >
> > +static void dwc_synchronize(struct dma_chan *chan)
> > +{
> > +	struct dw_dma *dw = to_dw_dma(chan->device);
> > +
> > +	/* Callbacks run outside the channel lock in the controller tasklet. */
> > +	tasklet_kill(&dw->tasklet);
> > +}
>
> [Severity: High]
> Can calling tasklet_kill() on the shared dw->tasklet here drop a concurrent
> tasklet_schedule() from another active channel and leave controller
> interrupts permanently masked?

Is it true?

Frank

>
> In kernel/softirq.c, tasklet_action_common() clears TASKLET_STATE_SCHED
> before invoking dw_dma_tasklet(). When dwc_synchronize() calls
> tasklet_kill(), it acquires TASKLET_STATE_SCHED via wait_on_bit_lock(),
> waits for TASKLET_STATE_RUN to clear in tasklet_unlock_wait(), and then
> clears TASKLET_STATE_SCHED:
>
> kernel/softirq.c:tasklet_kill() {
>     ...
>     wait_on_bit_lock(&t->state, TASKLET_STATE_SCHED, TASK_UNINTERRUPTIBLE);
>
>     tasklet_unlock_wait(t);
>     tasklet_clear_sched(t);
> }
>
> While tasklet_kill() holds TASKLET_STATE_SCHED, dw_dma_tasklet() can finish
> and re-enable MASK.XFER and MASK.ERROR across all channels before clearing
> TASKLET_STATE_RUN:
>
> drivers/dma/dw/core.c:dw_dma_tasklet() {
>     ...
>     /* Re-enable interrupts */
>     channel_set_bit(dw, MASK.XFER, dw->all_chan_mask);
>     channel_set_bit(dw, MASK.ERROR, dw->all_chan_mask);
> }
>
> If dw_dma_interrupt() fires for another active channel while tasklet_kill()
> still holds TASKLET_STATE_SCHED, the interrupt handler masks XFER, BLOCK,
> and ERROR across all channels and calls tasklet_schedule(&dw->tasklet):
>
> drivers/dma/dw/core.c:dw_dma_interrupt() {
>     ...
>     channel_clear_bit(dw, MASK.XFER, dw->all_chan_mask);
>     channel_clear_bit(dw, MASK.BLOCK, dw->all_chan_mask);
>     channel_clear_bit(dw, MASK.ERROR, dw->all_chan_mask);
>     ...
>     tasklet_schedule(&dw->tasklet);
> }
>
> Because TASKLET_STATE_SCHED is already set by tasklet_kill(),
> tasklet_schedule() sees test_and_set_bit(TASKLET_STATE_SCHED, &t->state)
> return true and skips __tasklet_schedule(). When tasklet_kill() then calls
> tasklet_clear_sched(), the scheduled run is lost without dw->tasklet ever
> being queued, leaving MASK.XFER and MASK.ERROR disabled for the entire
> controller.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261021-submit-dw-dma-synchronize-v1-v1-1-6af85c2d6f69@gmail.com?part=1
