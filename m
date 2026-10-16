Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012051.outbound.protection.outlook.com [52.101.66.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3073E25B0A5
	for <dmaengine@vger.kernel.org>; Fri, 16 Oct 2026 16:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168341; cv=fail; b=IogOp7wmwdJaaCYzT2KFG2hgl6ZlhxyvTM7pmxCsa+LUIUhnpi14lg242FtPPJzrjRSbm3xMP+UAyxy18nnkVgMTwM0dVFdKZqd1CZOObs0ot5Ky3WSnFr1ao10FL+lAwDfQw1I+GGns9mKRnZpOkwirSu4FWda6288wNAaqyz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168341; c=relaxed/simple;
	bh=JePWywyNTQtblRyPo4XnqNgzcUMHLKU6QF6jq/PX8us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GdNuO3T8LRRZCvUSvci9iZ24ZeiiEbu6Z6eeAgPAM6HrAPtofo1t7sK+nNYixbY1nObXPM5UnqzDuHNzMzldJ5+ETk1KsiS8e4stCf3YxIAJHZu3nRfCqwMgy8SthdNTWnNkw2IvYlXR5E5yc9VJlkgLSBbwhneiFUYG5SOTA0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=InI8/mcJ reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="InI8/mcJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nu8T2ydKI9F6HkbbM9k5mh//2V6d5HVY9t+KKsmiZSIg2vMLrPf0m589Wk6q7HuC3QFDcWqRy+/PRJj7QzZz4W8thv0b99a9fm+k4WdEyPUJsLBXcal7pGfkU7c8OqPjyVr2HXck7G5y0xgCFBsDBxq2H1c1RQV4zy9Escf/FHmtQ+ArdLwTS8na3XSgR20gxwSXW3x4jKgJNJGW06KQWnyt5BxpEuNLaj/8c+9T65qD2q2OYiYzZeyWpQXfyprWkuNrvyqXv6RgFm7X24gyZjRylA68ipOvn+G17jluLfg/0Wh3BVlkYy0a6rVjbiAP8K6gCVvgorj+vPzlIeCTjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kR6OgNpoHCEI3nlSmNsPhxbfdNCv6HrNGVSUjDT52iU=;
 b=e14G3zem2Jyb1NGWrSlZmV5/GWjKHtF7nvV/A6L9O3wR75tcUdNkUwtFbdGh2kXQRaqFeIi1kzmVpAmtmgYTJO5XpP5V0ngaSjmqpnXoJeJpS3RVJ2kSRKUnCziY0pGETlzn0NDcgSYW6OUHzzCrX0Jpy55Dvh5R0BfMl9vCpzSgOTpTx0BSMxC22tIhxJ/NRv5pAmnFbp1GVvWQ5BPB34MpKG/KxmZFy6KRBtpnK2txonJeQsj3VaiHa+V92yIKUOh4dzHo1K8Ja1fRNJwJR7RC22QYQZ13CDtXraYLeLGzgKrm1rI7HysU//Ff0ir45/I6ozqHa9lVhbqeA3LiPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kR6OgNpoHCEI3nlSmNsPhxbfdNCv6HrNGVSUjDT52iU=;
 b=InI8/mcJ8uR9N7YwXhLHPjdRStx8DMFE1jlhGdHZRngjU7aXcK2yijAdHux7catvHYurU+mSs8z6gAc+uh0lQ24ytieL+CZPCU9DQLH35csnW/W5fzmxl3Y9kLyXyIpEXZ86i36LtjTqG5tgVGrG+L+o61YuzwD9Wf21gBqL4Puav2iHkd2u4zbsCOOCGkojBNLetMjXdGj40nPMvZOZsHAdEl70gWQK7lqw/VhIvHSwNQUtO5OkgKwuP51LHIxYgizwa/MxxFLLdLiPssP/3CEhC7fm7H8gicGL+3weJApfE+fILjjJ1W0wO2QmeDgkj6ANb/15QW0YhueLIzJlZg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8977.eurprd04.prod.outlook.com (2603:10a6:20b:42c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 16:32:17 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 16:32:17 +0000
Date: Fri, 16 Oct 2026 12:32:10 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Nathan Lynch <nathan.lynch@amd.com>, dmaengine@vger.kernel.org,
	vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH 2/4] dmaengine: dmatest: Suppress bogus failures when
 stopping a run
Message-ID: <atJRihx8s9iSImNR@lizhi-Precision-Tower-5810>
References: <20260722-dmatest-fixes-and-fatal-errors-v1-0-8287709987ea@amd.com>
 <20260722-dmatest-fixes-and-fatal-errors-v1-2-8287709987ea@amd.com>
 <20260722160949.7ECFB1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722160949.7ECFB1F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH8PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8977:EE_
X-MS-Office365-Filtering-Correlation-Id: 445ee0be-90b0-470a-0431-08df2ba30af7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|19092799006|366016|56012099006|260925022911599003|260925021311599003|260925021911599003|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	gb7qjecNz5cgA23Q3vCj4AdbLGT2fvhdUMyfsZklObhnNL0BDUoakN/9PEAAbAPytFxmK8EnvprvEgfCI63igzZxzNICP8JKzTJWG/tHpM/lmqVKJXO0uU36Tt5SrkNniUDTx6aG+Kr5mi5iCRIlq3Aif8EogP9jzTQK2eibiFQZVUNYxMyd5CQ6s0JkSp4Z+ezjs47u19xsLZgvGHtzWX6QQ1g6z6Pxb/alkwzkrC8hzS4jAE3A0Yt6UsKvR4pJWlVgpZPudksZj6fKqoMSmU9ejnQIemBh7sQ6iz/Bl8tRwYvrvWPRL9PaSUvfnmK+hgGrP6U4ix9AfCb9lkt78wTULCuB3hirgPSFAwObgcyPgHbC/myuHswLlVF6wKVv+F71u4+noExXj82HaXR1oUZAlQ18nRp7IfjB6MHq7hoREjUW0BndZ2wpWO7XPKX6T4OlmDe9Q7AM4GLV8EfvHfhxtuab3k5tjllsYOfYcrmxITvfTXyvnQAzupQaFD9xnGh/3RU+81rvllEQ79J9NRH2Ju3TTDrAxn32f3Qun2GFLw5Sn35up0MAr25G+NC4tpw1J0QcoIBCk33kkSBBUXb50rxAtBJBJ5g+3h97Mdo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(19092799006)(366016)(56012099006)(260925022911599003)(260925021311599003)(260925021911599003)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?pqnrz7qHCkZpGlBCQcOzCwafb5wSOlJvffxdO+jjQf0MCYUs0mn/dMd18K?=
 =?iso-8859-1?Q?pk37cKYaVA3UJG158BqaS1A5dUrEvac7XCeJzAPFwvYB7K4zY+IvwBSeAI?=
 =?iso-8859-1?Q?+H7SVzjHPyk7FUsMLSqZaCKPZLSNvWagmvAfB+pApr4dvKFqAE0whPYFAk?=
 =?iso-8859-1?Q?CXy0dZ5O2jVLJGlgolmMo0lMj4QKUdhicmLpMUGoJY2OZ6fdNfoHw6GmSB?=
 =?iso-8859-1?Q?RrF//YYl4aqK7bgJeoU4QHJT7bzVzTYMyq0bbW7xYeKwZtQcwF42cXiYbB?=
 =?iso-8859-1?Q?dlniQsDBYrzsLqKDkuZgdFefhqDjvFcTVjoWM8rUpeUbgkMW03AE83YguI?=
 =?iso-8859-1?Q?c7mHxRfZLA2rYNp6ghntR3+0vB+4EN6TL/8yRhAT4aOnED5OdsZxlrSEWw?=
 =?iso-8859-1?Q?cDEewOTaqQf36+YwFEC+Gkz1hc5CZVUpoUVRff2eIx921UiqUyoYpBZ3Ne?=
 =?iso-8859-1?Q?e/f52sccvdap9199SJSoVBD+g74YoPMk0WoePL2W0kOUzyASitDsZHtDsx?=
 =?iso-8859-1?Q?TihovOpbW4L3VCzLZUSMO8TrwKIdtD0N05U05nLnbaaYikE0UI4dtFotON?=
 =?iso-8859-1?Q?8R9q+8JaanWcTXfRbLuTrQLxrn5W+l1pIakpEM7AYnY3t12t7XqS4twZCO?=
 =?iso-8859-1?Q?45pJd7JxtjrlQ1N2B+k7Dpre2g8rZwpkgsk0R4Np8g1a8xryYYhTf9n/qq?=
 =?iso-8859-1?Q?rRPbPBULOFQLf9tocMlqAOmyR+KOaZcjs9lQ3QENhRxcvTsON5v8m3xmst?=
 =?iso-8859-1?Q?j6PDmOFq/QywTzZGtT6s9QH66fB5fNBWy/+2ukrfDPPKE8aNThJ0SD86YI?=
 =?iso-8859-1?Q?kqEqasIRWLB8x7TFFrrO8BJuVGjHUaCtJ6Rv2BR6mqxgkLVLD9f0QeBURR?=
 =?iso-8859-1?Q?KvoKTbkVbgyYcQH+9P0dwkKUUNfAJF+SiuDBsIsYCDSv9JZL2ki+zfkzu5?=
 =?iso-8859-1?Q?B7DYfxmZk1cVnbulNUeOvPPnPGz/v1ppJ4vLU0R7rA96+Q9mVT34wstf5n?=
 =?iso-8859-1?Q?n1W0+ogat5hGgQqVtkg+RWi6ethMvdpsE3rERbVykBmeUROxueB7NjBgbp?=
 =?iso-8859-1?Q?ypYF6jqrQ6xigv1l+BC4QWxCLzqpp7rnzOb1BBSO6ru/OuglxPx3nNpO7R?=
 =?iso-8859-1?Q?MVu3/hD0xVQ7NFUewaxXYPibCTIzY8kY0x+fFyAB/bB8Uq0Y9CIYl9wHuF?=
 =?iso-8859-1?Q?U8IHiilsPK33at46I901tcMRuIc5EPQb+tU4RAO5+tYcm7rhn0gcMxSkmI?=
 =?iso-8859-1?Q?jnA/iH9RKR+h1AlN12u12mcazxlAYUlo6NDKHEQhUvvGhKTZ9Xy/oC0yxO?=
 =?iso-8859-1?Q?/N9eivvmJFE85ufLkUMhuMXShefguK490V/8N7TwjmE2GZ1v38UGohGTAt?=
 =?iso-8859-1?Q?z9ZgVJPtPgpb/hzhpFzk0Pv8gaEx/dDkq/u+P2KSDqaAXVW2VQHkw741hp?=
 =?iso-8859-1?Q?keTki8REyWPvi1NesOhX7XD7J3JSBBPZiDsMI/joa9C3FjWbl9EaYtuQe9?=
 =?iso-8859-1?Q?o9Wg+ELdAMcvm5jxc0kR/kpY2DmJ3uRepmdMO8T8UhZU56RKMbiIfuoV0D?=
 =?iso-8859-1?Q?MkVx8QukCFTvNf0A1GmPyMyHrEvYGEyyn0uPMlB+SDFZLzMSYApINRRSdg?=
 =?iso-8859-1?Q?oAPMPHRoaEzjm7iUfS5UUZXcZ54W8yIWQ331SZMZ2wwnQFFAUCdElzkUEA?=
 =?iso-8859-1?Q?k0kw7ESEw0+fINSQSWF46zMwEKhciUa1x1hk8cfAup+rRqDe6LxnsmPlIe?=
 =?iso-8859-1?Q?dSuIRanALMdoWjARw7IByGukaGB6TNOcFojFXFUCZGYAyadAc4DbgeBt8A?=
 =?iso-8859-1?Q?3bIfRj6PU+5yf5yAafaqa72JIJmr843B4jmuIxEUEkJwX33yS4J6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 445ee0be-90b0-470a-0431-08df2ba30af7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:32:17.5714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lL0lv4fNQ9K/WpUeuM4ZtEeM+Vs46wrFbvP3R0z1KkEVHSmwIhE34ZP2lNIyzz711Dxy8hNtItPkbBh39NOKzJvMTWjoKJK2ib+fMsdde4AEuRJ4MhL4QXrqYJ9lInMc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8977

On Wed, Jul 22, 2026 at 04:09:49PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Bypassing the error path during thread stop prevents dmaengine_terminate_sync() from being called, leading to a Use-After-Free of the dmatest_thread struct by the completion callback.

Look like make sense. Please check it

Frank

> - [Medium] Bypassed DMA status check when stopping results in unhandled DMA errors.
> --
>
> --- Patch [2]: [PATCH 2/4] dmaengine: dmatest: Suppress bogus failures when stopping a run ---
> commit 65f43e5ca342a54064656c1ebe548edaa5c088bd
> Author: Nathan Lynch <nathan.lynch@amd.com>
>
> dmaengine: dmatest: Suppress bogus failures when stopping a run
>
> Writing 0 to the module 'run' attribute stops the test threads with
> kthread_stop(). This commit introduces checks against kthread_should_stop()
> to suppress stale failures against transfers that actually succeeded.
>
> > diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
> > --- a/drivers/dma/dmatest.c
> > +++ b/drivers/dma/dmatest.c
> [ ... ]
> > @@ -848,14 +848,19 @@ static int dmatest_func(void *data)
> >  					done->done,
> >  					msecs_to_jiffies(params->timeout));
> >
> > -			status = dma_async_is_tx_complete(chan, cookie, NULL,
> > -							  NULL);
> > +			stopping = kthread_should_stop();
> > +			status = stopping ?
> > +				dma_sync_wait(chan, cookie) :
> > +				dma_async_is_tx_complete(chan, cookie, NULL, NULL);
> >  		}
> >
> >  		if (!done->done) {
> > -			result("test timed out", total_tests, src->off, dst->off,
> > -			       len, 0);
> > -			goto error_unmap_continue;
> > +			/* stopping: dma_sync_wait() let the transfer finish, not a timeout */
> > +			if (!stopping) {
> > +				result("test timed out", total_tests, src->off,
> > +				       dst->off, len, 0);
> > +				goto error_unmap_continue;
> > +			}
>
> [Severity: Medium]
> By skipping this error path when stopping is true, does this bypass evaluating
> the status returned from dma_sync_wait()?
>
> If a legitimate hardware error or timeout occurs exactly when the thread is
> stopped, it looks like it would either falsely report a successful test (if
> noverify is set) or misreport it as a data mismatch.
>
> [Severity: High]
> Could skipping the goto error_unmap_continue here lead to a use-after-free
> in a delayed callback?
>
> If a delayed callback leaves done->done false when stopping, failed_tests
> won't be incremented. Later, when dmatest_func() exits:
>
>     if (ret || failed_tests)
>         dmaengine_terminate_sync(chan);
>
> Since failed_tests remained 0, the thread exits without synchronizing the
> channel. Then dmatest_cleanup_channel() executes:
>
>     put_task_struct(thread->task);
>     kfree(thread);
> }
>
> /* terminate all transfers on specified channels */
> dmaengine_terminate_sync(dtc->chan);
>
> Is there a window where a pending tasklet executes dmatest_callback()
> after kfree(thread) but before dmaengine_terminate_sync() is finally called,
> leading to a use-after-free on the thread structure?
>
> >  		} else if (status != DMA_COMPLETE &&
> >  			   !(dma_has_cap(DMA_COMPLETION_NO_ORDER,
> >  					 dev->cap_mask) &&
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260722-dmatest-fixes-and-fatal-errors-v1-0-8287709987ea@amd.com?part=2
