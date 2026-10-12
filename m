Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013022.outbound.protection.outlook.com [52.101.83.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1899448F02A;
	Mon, 12 Oct 2026 14:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816982; cv=fail; b=Rna16jB40DxBrbofEnkwHOFaCMmQ7lIIH1beH/euQiWCQQP/VRAvM27HDGW+VQg0K9ngX5IggSU2Nk4/L13JbTWJ0vp92pFDpydJVOeiF/5Z9Gi1WeFcdWGd7fgJ4zB/ghQI1n0ZlwHDTSzogTSUdmnXyoDHrGIkj1TXAvuJmPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816982; c=relaxed/simple;
	bh=bTQWPK+O67KcE3baaoS71vpYJivSxWGw/6TYysm3Auo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SNzZhPZ7CMwWNutnMN08Du1K92xIIc1t0ut9z1yp5eABtFRMp4A/sd3UKrKDuppNnUaIRIcexaJ4eV4zo1O7G0/W1uxG4wyYOMXeg77M3KZ7+1va3KEGZ230lG/hC3Xp8ilHbuZQ05djwfEJo+5ObGxZlN+oeycDM8fNQTH/Zfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YUkjlMBm; arc=fail smtp.client-ip=52.101.83.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YUkjlMBm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBG28Xn6/SjKuR7gRvAKTqOj7O9lV2wPg4tRf5j+Sql9zf1eZ6WING/AkOI2661U8FRxoZPgmJaExlMKjQt0ETUt9VhcR7wqDaO8n3GngNZ27EzZaoHWnY/A8pu0XFvKbw0MU6OQcdfkYa/bKnAI7Lzw641Ugeji1xxRJobuwyp9O2ekqBgG1IbD57KHHNPYj1yzmvXaNJoGg84AQOmn83zCoZqwgbHgCqVXEsweqox0F5rM6MXXqvBXnUMVO3QDs/4sOdKWNJhJeJ7d2qnAQ9uubWVtEaKU1TgNK9mawkpLoAazQY5YhKX8BraPtOxmDcvvYwRjbbJCBjMIpDG5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhX1jOBpiQdUBC/y/BO6o1f/LId1fxfY7aM0j1FGYvw=;
 b=eb621XR1MGepsjCAkvhaIB+qUhd4BjiWQQBO2stiwlkqNoJvImsKn7CezrwRgV76pbU6wbrWtyYe2poq2JUOpEfEfxYiqMQhf+6axuhsVJPYKYBeLcdz07+E8MSrwVIvvwdiJCQ+l5hg4m7ok8vh/q5pT829RhryrfClqGXOuVUUGNAGbwNiHpoJrgDg0Wfl+GnQHCpIbnfEMrNuSvTkkja2qhRo+UxQerPripTFmQ1MynAZ2yWYImqgvxYud8YtlWUa7jLJfnJVY05+7ad8g3EVqx/BVktC/6duqnY4hLS4xIzFUiBQdiFSR82pJHVvZ6zQ45MRZ8pcZl53eJ15pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhX1jOBpiQdUBC/y/BO6o1f/LId1fxfY7aM0j1FGYvw=;
 b=YUkjlMBm19DPhDBMma4oRThWMbiCU+SQwRaXiUMBMZJU2nK75MKitaH/86wloIa/XEiE7DdW0S2uchqlxrgk/duvUrMSPJKQcqnREoUJmQGOxhdSFNDQ9rxeg0gU2Gk3H3i3mllhx/dH27xpkMhUij3I1oZxVTYaGK+rusYRGE8ngBe89FfKHR+qkfnlsYIQhDNM2f0x0jxx4G4pyd5U0BM4GC4OXgQxJnwGgNevmiYElibDR//3QqFoSbD7bIcTPx/NpoXw2LaX2B6Tidc154JVeE53U2jQ+1/vk4izwWwYay184on8wqvM2Wx5ZqRqCKryUSSt+ATqrtDes+GG4A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB642219.eurprd04.prod.outlook.com (2603:10a6:20b:799::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 14:56:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 14:56:18 +0000
Date: Mon, 12 Oct 2026 09:56:09 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Seraj Alijan <seraj.alijan@sondrel.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: dmatest: fix race between wait for thread
 and thread start
Message-ID: <asz1CVWrS7zst1rE@SMW015318>
References: <20260828151024.2081478-1-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828151024.2081478-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-ClientProxiedBy: CY5PR22CA0090.namprd22.prod.outlook.com
 (2603:10b6:930:65::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB642219:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a45359-b265-49a0-090e-08df2870f880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|19092799006|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/dd0LYTcr6LRoPq0TJX+o3noODfpJ+75ksua4suG+x33sNFRUl26Awuj5+BWZWunZ2jK8xi/0drjDDrFG5+krDM0eeaEqHo+DiRK2vrOFd9YJFH9ZKchDsAHdQl5ygHb2+vHDqVTXc0dNOuWaWbtxKj1bpkVC9uqI8zre2/dUKQuOdIclV3VN8QWUQZg1lle02Ab7mDKXT35+ta6vOVYylVWBGHPNdm8afPxU1QYdHgQZL/gNsU4LlieAgw/RzVFYmVt6e1s6cRw4E1HMApryfioDfNqdjEUoTNBnlCVSPLv2Qg3BjRD0K4+YqeB5iMI4juSYVg/kFSi0j04vE8wKyyFUlF4X7LdV9kNe5HLgzqGX58Izdyr5sFZKO4YPlY5tdxuzspJ6uqyg7HTZuiuhJaJ4ZAi4vZDBKLXJhUdk3Efz1n4BnlVdDCzTYaT4QXnInem/dG6sMEO2haI2Cya3nZESpx+lR0LZ7W5sGK+mK+7ZNa+DuvsuQN2OcWSCc/A00dsBFFHwfTt9hBY2zBoInNG+Ur1CVsMUeMZEK9JgqrZN73KmohLA/CFJR+BJkOXHMyCqZaKdKeW/VUa6lbqhLmSOyhicYSCPOEnW8YGqgI+Z+zA5uaP2aRyh6Bm1hEIcjn2RTdRcwKltjrUWA5Q8YhmMEYR+8rGNWms1crFtHg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(19092799006)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+KBiRJHTayOcOsIJFP3cSaWWtJuuNrOxSR1raFarVH74r/Er3agEaaSCAI35?=
 =?us-ascii?Q?G5cl5hc0f7pWSJbonoYvstQvfTX624G5AZzsIuoo0KkqH9hn0jcaH4ne/HG7?=
 =?us-ascii?Q?6DzROKDZdFj1zr0POwssgzeXTu8x/ZCsuAhxpKL0Ff2nMyuiaRPo5NY7CX39?=
 =?us-ascii?Q?cIqJvrFfCJsJuq63VQFwmMAeLpOVapLjdXGJBuw+QlNCVuXPlwWDnBvTF8iQ?=
 =?us-ascii?Q?MlsIAoZL+7E0MWO1Ytz6CopBGUFILB+fsRhT2M1BaxazSsYslpnhWhi3ozsl?=
 =?us-ascii?Q?zdGhqVp/lLNj28B4Gcq7tNlopU9yq7jCV+D6BitdLzGd9TsDbFR4geNUIhRK?=
 =?us-ascii?Q?OHehBD3GkamUc4IANuCdMs5WWqVpIA8GSzQ9d6e/qR+sUmBlsR9t2zDWUGb7?=
 =?us-ascii?Q?vLquHHJs0Kmfucu4FA+YISgThKmqAwWa2UFpVF6O+5e+bEr/FNQ1I96R3EKV?=
 =?us-ascii?Q?ChpGEe1Pn/fprdTMnOuGruZ67Je4PMdGr/AKCHbNyKhLeySIEjsMinU6G63E?=
 =?us-ascii?Q?ErO2flJA/SYM3vp9MVNVRC6RvDrM1r/SD0XdIfeznrPm3BGWrBX8S985SIz/?=
 =?us-ascii?Q?48TLYfvxWhoECkfscnuWWdCPRHRRaHeGm/xFSHRpr4AjOGZrLEA2WSU/BigN?=
 =?us-ascii?Q?oXN+racd0stjYdRqQYLdIQzxWQp5LOlv6tJJRV7270DpNZxYt8wYm0hrHEx5?=
 =?us-ascii?Q?DMZiBuVIoTXWColkJ52mtJz2r2AVj5kvayBqo5hN4v3T08P9gcP4z9palQ6L?=
 =?us-ascii?Q?hrV2res5+UJBBd8iBAd3ch3PMO7N6fQEqRGvo8J3r24I1AVfHphG2i9lLF73?=
 =?us-ascii?Q?fLOVcY6E8i92z876IP5FrctAxkkBM2QYONt7s9QrSdD/S10DGDsa6BONPZqL?=
 =?us-ascii?Q?ibfq0j5wJsBR/+JeDZ/pNgYsjIXepH2824j/PNL8SaYvExAgZAhgIi6jGaAI?=
 =?us-ascii?Q?KdyAP1uOUmpeK2vybAwuxgy8T0niDYu70PkTo5WxcWnooqKKk9obNOYsvoG4?=
 =?us-ascii?Q?JX0Wyh9BPbwOGfPFfqhGXTcmPDe/X1TUEbRTXtsJt6ZQcxOP3leiWALYBMwF?=
 =?us-ascii?Q?0lKf/UZVvlDLreYDTgnFIz9T47rsBgm5MYPrbwYrM/kdkm6r1nhrKbnOj5NN?=
 =?us-ascii?Q?8P1dzrYfeJ6ZSRcBuv2ZUU1KyMWHy8uZNHFXo2B8AWiPxDmMRN511AgH5fBm?=
 =?us-ascii?Q?IuyfB+eOVko+j1usHcBBIhKTdOeQmZ/h5jja7Xi9k0to3YLi5I4b9WVJC9mz?=
 =?us-ascii?Q?K3OX+Mg+PGhR8KtKtduYR18ZFuXZXWhdNNNf8iAakx2JlBccKBvKs7s6Rdd3?=
 =?us-ascii?Q?QAvBxjN2DeXOKLae1/fy/A9F+xoTYDhHLFEC22b32qBbjGSB8yKdb4yKg9aH?=
 =?us-ascii?Q?SNqejKvgFweAioPVuMPHHyUmmb+U1WTVSgr37agRDB7uX0TnylwLLa8HFAvs?=
 =?us-ascii?Q?uWCb9DlhA5o5T4SquXZGMoT4dnckQWpTlnynSNlBuELWx9dUhg6mMg2cJAgg?=
 =?us-ascii?Q?DHrewdEwNC93CezBaJv6qXWCpQxAg/iOTi+fF5Z0f/9YMMM/gZ9dnhfOvRRq?=
 =?us-ascii?Q?uOM6ps3lZq3GPIKnWhJSoA8cEPPkdBrAffUovQ4J/WUFC6j2bdgi2XxUtf4M?=
 =?us-ascii?Q?w/dr2dudhAc5sqIUUWLQ5/cposkuxJGmPDb+oF5J5etw55B2ULjB5LjWoVf6?=
 =?us-ascii?Q?DThFOmVkrQUBVztqlP1M8Feir0VxNn5mIYbqDsOX0ENehR1kFTiJ3jxkaxSn?=
 =?us-ascii?Q?wjSliha4gP29VScEkW7MoTstq/qIUQvOj1zqCqgpGKZ2Ban8D/sP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a45359-b265-49a0-090e-08df2870f880
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 14:56:18.3727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xx+j0J1lCMxx0ukpXt8pJllqz8rV2VWNdRyJS+aC/lBvvQlogTtlspxBPiD2vIX4S3mr1GwzcP/ZrPtEhUDS1AzCHne30/Ij/jri5CsoG85M+lKZk95xk+UTLR+Tm3+L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB642219

On Fri, Aug 28, 2026 at 06:10:24PM +0300, Cosmin Tanislav wrote:
> [You don't often get email from cosmin-gabriel.tanislav.xa@renesas.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Each dmatest worker thread has a pending and a done flag which describe
> the thread's lifecycle.
>
> pending is initialized to true when the thread is added to the threads
> list. pending is set to false once the thread is actually running. done
> is set to true once the thread has finished its testing.
>
> When the wait module parameter is set to true, dmatest_init() waits for
> the !is_threaded_test_run() condition to become true.
>
> If the worker thread is not started and running by the time
> dmatest_init() waits, the !is_threaded_test_run() condition will be true
> and the wait will stop early, before the worker thread is even started.
> dmatest_init() exits, defeating the whole purpose of the wait.
>
> If then we try to remove the module, kthread_stop() will try to cleanup
> the worker threads, interrupting wait_event_freezable_timeout(), which
> will return -ERESTARTSYS, causing the "test timed out" message to be
> printed.
>
> Clear the pending flag once we wake up the worker thread to avoid this
> race.
>
> Fixes: d53513d5dc28 ("dmaengine: dmatest: Add support for multi channel testing")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> V2:
>  * move pending = false before wake_up_process() as suggested by Sashiko
>
>  drivers/dma/dmatest.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
> index 2ae3469397f3..f654a00e0040 100644
> --- a/drivers/dma/dmatest.c
> +++ b/drivers/dma/dmatest.c
> @@ -610,7 +610,6 @@ static int dmatest_func(void *data)
>         ret = -ENOMEM;
>
>         smp_rmb();
> -       thread->pending = false;
>         info = thread->info;
>         params = &info->params;
>         chan = thread->chan;
> @@ -1141,6 +1140,7 @@ static void run_pending_tests(struct dmatest_info *info)
>
>                 thread_count = 0;
>                 list_for_each_entry(thread, &dtc->threads, node) {
> +                       thread->pending = false;
>                         wake_up_process(thread->task);
>                         thread_count++;
>                 }
> --
> 2.55.0
