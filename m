Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793115263;
	b=1RoQ3jTBAL+RM3dJxNWIlnAfOvf5selTO6BRWGveOd21Cb+3PY6RwtiLJ+PxAPuAcpcr
	 WDCC5O/8eP7RpxOulE7onV+LWZAYE0AAynbWRr/yO3yJiXJGIJwHQnH5cn82bDkproHeF
	 e8uWveQpp/JJrGh9jkwtOq0+4T9pjoDfx9ZT78VO6Z+DGCM+9/wR0VS4Xz+C4fU0apo7+
	 AKNR9LFJBlhWJwy/tykwDlSQtss+A9+NhHlkcgN6STpE/syeBE8TcHtKr1/1o5f/rkh3/
	 rKPXw8AzuCUTyuv+opPvFep4UlKqm8rsDyOVSIW1g2g/4VE/zk8ed3G+FtESjuzg4+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115263;
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
	bh=q35egD9nBRLaau+K1qgg4jwQ8NaFRQb8ly4McylFqqs=;
	b=gbwDQEAMi8yZ33hc86XMt3Cf1i3y99Gadatge0x6EphucIz2WQAUdvalUxQJoPzwKDXH
	 0p9qGEpAsKLXAqxZH7AE9/+O1IzKPf1kthQ77rfJgFZBnqa/HIw/HuY7HVO1eekLPwz1S
	 HJWJ0s4zs/dqyHzDEVcURHk4CQFmjx5COSfRTd4Ha/9hSeN6MM1fs7VD92FjhprVmQH9k
	 sP1rkPy8+NgJD/GlQSMwzNQsl1zFpHj68BY/TjyRNPoildKFiSJm54jYWDM0SlWUANGBw
	 3tuzKWzZm3NvA4K4HrskOzuooWSYwbK2hEPwDE2v1k9s0Ydsdatod9oM77uDqEqZAPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=X9URN2sy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.67
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCFB606A31B;
	Tue, 27 Oct 2026 15:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DCFB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=X9URN2sy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWJZpE4eI6qIuR7MvKe83tl4WHi/2x3tJz1AllSQIWTDEJpdf2Px/RtsV32u7XCnil7KopJXvx4Rz3oo7Qrh6SLg6lCkw9Wkv26mLYLbzRxB07mC1fG/mb8Br7F+G8pInYPIM/LCCfCjAWj4kRTXdInDIOzXqmOpVwHwMUw5dRpnphlc76UUKaNNI2504b/FgrVe45wkpFEzCxl8sLNWz1pm1lyxmYO3GSeFax4UgYjFXUg+gV7FMB1GWTDz8S8GgJNFGUdONkgRw4EyuTckxCuFr5hAIw11LbOJ5m/JSdsJxcMNUSR3z4BZ2KFmen6LFKpgzzO/Dn0jSTHgzZ3YbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q35egD9nBRLaau+K1qgg4jwQ8NaFRQb8ly4McylFqqs=;
 b=OB3OF8PRyUDF7ktTudeo2sgeeRcj64acin6pMzXLLFYd++1NOxDlXTAHB2cWYOIL2fSsbSeXD8Q48y6VNwzj/THwaEjwD70eXvyS0kZ48ml4o27dGxskJwUEeykpWR//nfwOV0sb1wTyRxlF4KuMeq8vWtq2Ck6Ysy5YkukNF+B/IsP6d60ydKddioqiZtc6S2ye9fWghUojePk/HAQv04iUBVBArQfyS8GTCK+NIhTYWsd2vM2S4QEhxPV7faVeo2KVUuFrVjc3P1LTBGfl46u4BMMDq1J90LhXuZqMdS5rn07vF0E/Lef8IbO7KtaH+F5xKClr6BARN2boerkRXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q35egD9nBRLaau+K1qgg4jwQ8NaFRQb8ly4McylFqqs=;
 b=X9URN2syhNJWONy1q7X9f0FZ9vpBi73E5Axf29bz+u8ZbOaIkzfGkj/bRQopVh2FsWeSz+UDf5zKPj6NGVVdpimS0FHduDknAqRJ8qMacSpNZsO4yjQ4uIsQxVlJCcCWJVVssR7eA7B/SsGupKuUMs+n7WgfBlEhX7F63U+UfdIN62EX1aISTfu+sqO7juK3duPlK1ezBpwhNZuhXopgROnN9IqZLq7fdvRT94EYGvjLDc6hRbOWiTzPYyrVNzQGLEHBIvwXjYIdl2dAL/vsYhg/katqKmM1MqZG65Zw7pu3YzTfk6sMKETFhzOUPnDvFQTDiOCcy0UfdqMwfu/ZMA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB11596.eurprd04.prod.outlook.com (2603:10a6:150:2c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 15:34:16 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 15:34:16 +0000
Date: Tue, 27 Oct 2026 11:34:08 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Mizuno Miotsuki <founder@crepuse.com>
Cc: "vkoul@kernel.org" <vkoul@kernel.org>,
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>,
	"ulfh@kernel.org" <ulfh@kernel.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"huibin.hong@rock-chips.com" <huibin.hong@rock-chips.com>,
	"rmk+kernel@arm.linux.org.uk" <rmk+kernel@arm.linux.org.uk>,
	"sugar.zhang@rock-chips.com" <sugar.zhang@rock-chips.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] dmaengine: pl330: Fix unbalanced runtime PM
Message-ID: <auDEcFRBeICtT6LP@lizhi-Precision-Tower-5810>
References: <1650450456-34351-1-git-send-email-sugar.zhang@rock-chips.com>
 <20261015-review-pl330-pm-original-v3-v3-1-5be09f37df77@crepuse.com>
 <atEEi7Uc7DI2pkg5@lizhi-Precision-Tower-5810>
 <C35ADE64-5E80-454C-A66A-BA2B22EFF386@crepuse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C35ADE64-5E80-454C-A66A-BA2B22EFF386@crepuse.com>
X-ClientProxiedBy: DS7PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:5:3b2::21) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB11596:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dfa3880-a46b-4a43-500e-08df343fc283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|23010399003|1800799024|7416014|22082099003|18002099003|6133799003|261026121527099003|56012099006|4143699003|5023799004|11063799006|261021121427099003|10067099003|261022105027099003|261009221227099003|261009223027099003|261022075727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	R54BU/9XBqKeVrDog09B6gABGwkJg/TnzStv04VjsV+TbBvTC4NssYGcHm/K+F0B8Z6syub7d1qMbByHTwT5Ey8ldYJ38MDNt8Jm0178LQXE6kWhLkARIxYXkEtDCwMhVLCUu7SHRghWalIVw5HPVHOB8xwPA6WyQLZWaDgnLxNk0W3y5giOuWp2nBBpB89msw5Fo8s/+goENMVpJCLMYyzLeK1FAbzh/C8ZB73Z/wiRUv7iUlcC26W5VmgU4JnlZNhFBZGHmK/CuG49VS7vXZsCumyFMYqWqf82hLxzbvWxhspHjYMR3IyfvPO3JvYktYtanje9GMRAW7xpHZUj72QO0c+QYpwHflZkQ6IrSQeZaAh2SpL0HGBEFO5zYa5jsFEJu/euR6T3CHIPY1WaakiOmWjW0i35oiRwUiK9An/iSwoR2QDJ0ID5Fr5s1FO4SPCEc8b4sDWar9QVOF8rAXZOJGpP/C3Fc1RtVZa4EJ8exYULBrKbGTJ962QYBYlDovcT0nxteLC0exaA6h5tJYC4zKTnQEAH+XhQ3auNtwUPZlDllQmhylc1uMNbnY3gE3GBLQofwyueJGGrIJ7nwuBRT5mvNThDQ3T4H1HctOROO6MGhJ82qgBRqZ9H4Mo43Y5Hvsue6WOnHZeoxLfTi7I/hZ2zpgd+oMBTdbPkTo4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(23010399003)(1800799024)(7416014)(22082099003)(18002099003)(6133799003)(261026121527099003)(56012099006)(4143699003)(5023799004)(11063799006)(261021121427099003)(10067099003)(261022105027099003)(261009221227099003)(261009223027099003)(261022075727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vUpNgnDj7rrLf8gLghTe0jOUnlnLoLzysMkIot8BPLgj7xUCeEI0ZU+eB55y?=
 =?us-ascii?Q?cGm/notYFLrs2uuz+MPn//yhDZeateq8o3xw+7U1D0Jgs1NGZbvjfziAoEF5?=
 =?us-ascii?Q?Vb3Drwr78xS+CoRxm2RyZQeqs8sUJPZqeAhHBDtSE08GYNqk+O41FmxT0Omk?=
 =?us-ascii?Q?kLkllNtYNYvU5I1sCTdtUQLsLy79nyXxCAtBYz98YTJL+1I4gbWQQrNKXH5g?=
 =?us-ascii?Q?9lUP5QEopGdcR2m9Sz+vDr9HaJG9ZBxuTPNUqjqvXAx+EpbX1/x2Y6gjgHau?=
 =?us-ascii?Q?hS7M1/w/DRTavCcLro0NsuqIi3hRUtirN+6cztoNX7sZMcBjGFk7IBGqlaOI?=
 =?us-ascii?Q?JkdbcwuxBamMPkEotHFoNbYU3+GjN/SNSVyvfsO0SGUYtEUtTZ+NWo4q/+Hb?=
 =?us-ascii?Q?X3zTpXevR62L8cn39UOknsnYOaiXgdHxK/wh6ujKjl6tRTJMTCbYoSWof4lo?=
 =?us-ascii?Q?11hUiVut5Gw5TmatpZb/M2uQGYyciakHosm8uH+vKEfA4IPSOJ98cSiMeGz3?=
 =?us-ascii?Q?+R8+BbTeWFT9P8eAYZNE4tJ9w38EDIV25cXzOy2yLG+m8xy2f+vGvqP6K8Un?=
 =?us-ascii?Q?mROts88hWlaI1bnrjVx5qNW9H7ZcGznrsNCfhSCRyBR4aYF4o/Vu+S+/vhgC?=
 =?us-ascii?Q?LeJ3YrcpaJIkkaqPIvTHncmdyAlKzUcVA9LJZX0pX5rw1cU/KWeE29T6/Vjz?=
 =?us-ascii?Q?zkFlnv0CtFc5g52IBtqS7Ji78pY4Z2jQ/P9nj5h2txsKdJ/w6f+d26lIc1yP?=
 =?us-ascii?Q?Go49F8tYoDxoKOg2qC9456ZBet74+QTrcolm7XJLt14A7WRtC2IrPYZQWTqZ?=
 =?us-ascii?Q?QivyDfjT+iWhiNcIda2ULVGLfqxFRY0y1eaUFhZNE6l4QqBytP93KF9Yb1sb?=
 =?us-ascii?Q?Q3H9kPJDseYjtkFe1ziNqwdhCzwMYWeElvMT5lbeuVzYwWhkpIfQP5LnBipJ?=
 =?us-ascii?Q?QaWHoY5LvkrojasTtsserIpnqoQXHzo/pngtUwIQBGziZHY0HHaTOBysU/Lw?=
 =?us-ascii?Q?ci6k+Jl3NfTk3F0soX+Qnjp/9ooSmhOUB3nS+6lpuZ7OrQagH/HL9cjbsm/O?=
 =?us-ascii?Q?ylHxwshBvxjYX91zbJlVu+UuxKj/pi8qOWLPgyy64ReTlmJMf4fmWkrRScoR?=
 =?us-ascii?Q?6qgB0yN7kVhOFi6sUtm+WZ0hSLcev0zLEeUXf0ufFgX7hp9lU7qYEyiDsAWx?=
 =?us-ascii?Q?a7OIhcDtd+u5jb8nXcvPQUh58p9Hp2WD5UUqVXe0mvw3t7+hywl8eNVWu4Sy?=
 =?us-ascii?Q?9WJfV5jpZIhOJ2XzWKzBTewMTBFmx6LPk+PlAkjkz02/y5hRBGpsxbhkr+86?=
 =?us-ascii?Q?H+fTRRdcf1G3ImZoLi4D3ImeTuROFuB8OClg2hX9XLzcO0XW8Sg+za2mJGCo?=
 =?us-ascii?Q?rq/CPlbp7S9y/IFNpCFsnppiA8lT1YcPCUjGGJVkvVqyebohTmV3N9RuBmgY?=
 =?us-ascii?Q?vJOV+0IhSiLTB46bXAZzFskwyUee1zoBhA2ApbG/V0SDz8QsFJHjYnhwHWmz?=
 =?us-ascii?Q?C/8JSZCKWF1b5EFdpW3cSnmWVj2iMVZ5yLn5J215b7OGCB7/LbpV9DpdWGt6?=
 =?us-ascii?Q?lVT+GERgl4/JHFkXuEs5oJTEW0N0sJQuCNnz5mBf8Tk9viRWtk/pL1AZkGBx?=
 =?us-ascii?Q?oQ8DBDrDChfWocXBB71n/idLUf5g4LeG2JCh/tzvYJv9gw5t8/+iEg0n6cnR?=
 =?us-ascii?Q?bR2IrCGt7gtpWJFAhQOgKWBm/kBeXTWiTOdiFsyS0vaIfjj6toj/uzBZKKMU?=
 =?us-ascii?Q?puCxRe941E0FhbJkhYECL6MJtBsnFvhCcHK3OB5gx9s12sgtMb5P?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dfa3880-a46b-4a43-500e-08df343fc283
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 15:34:16.2818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AuKmCbXmMbTySoJqRm0kVX/ySMg1+2ST2TO7oM0MaTiTl9lJNsAiTt03KmgTAT8tOW2ZbtkjY987kiewuDJ/yvHMkrn/o0wWdzLS41JssTOJbJT1NpVtH1IWAPuEAhMz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11596

On Fri, Oct 16, 2026 at 10:49:31AM +0000, Mizuno Miotsuki wrote:
> Hi Frank,
>
> Thanks for the review.
>
> > Look like need lock between terminate and issue_pendings. There are should
> > other problems if interfere each others.
> >
> > terminate should wait issue_pending finish and block queue new request.
>
> Both pl330_issue_pending() and pl330_terminate_all() already use
> pch->lock to protect the channel state. However, issue_pending()
> also invokes pl330_tasklet() after releasing the lock, so this
> does not establish complete synchronization.
>
> I ran a source-based interleaving test. The original
> code reproduces the extra runtime PM put after termination, while
> the proposed one-line fix balances the references under the same
> interleaving.
>
> > This function can be called in an interrupt context
> >
> > call pm_runtime_get() is risk, which may sleep.
>
> pl330_probe() calls pm_runtime_irq_safe(&adev->dev), and the AMBA
> runtime PM callbacks use clk_enable()/clk_disable() for IRQ-safe
> devices. This allows pm_runtime_get_sync() to be called from
> atomic context, provided the relevant PM callbacks and dependencies
> satisfy the IRQ-safe requirements.
>
> I agree that the remaining synchronization and error-handling
> paths deserve further investigation.
>
> Would it be reasonable to keep this patch focused on the
> reproduced reference-count imbalance and address any confirmed
> synchronization issues separately?

This is quick fix after I read code again. but original mothed is not
good enough, which mix use check varible and runtime_pm reference-count.

If pair get() and put(), needn't pch->active.

if (list_empty(&pch->work_list)) {
                /*
                 * Warn on nothing pending. Empty submitted_list may
                 * break our pm_runtime usage counter as it is
                 * updated on work_list emptiness status.
                 */
                WARN_ON(list_empty(&pch->submitted_list));
                pch->active = true;
                pm_runtime_get_sync(pch->dmac->ddma.dev);
        }

simple call
	for_each(work_list) {
		pm_runtime_get_sync()
	}

ideally, there are PM API (pm_runtime_get_sync(, count(work_list)) to bump
more than 1 ref count. But you can use above code to proof concept.

In pl330_tasklet()

 while (!list_empty(&pch->completed_list)) {
	...
	pm_runtime_put_autosuspend()
 }

Keep pm ref count is the same as count of work_list. So needn't pch->active
at all.

Frank

>
> Thanks,
> Mizuno
