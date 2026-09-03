Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021106.outbound.protection.outlook.com [52.101.125.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08EC331A57;
	Thu,  3 Sep 2026 06:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417979; cv=fail; b=YuQsbEY8NnS8wV7Cz/HeUjV8/fIVfwJDufYXzTZJPRWHdnzu+dt2ce9RRDelAJfiv9FhlwfAPHDVpz+ffQXfzwEe6xFi9pTEWcCaqOK57wdaB7bIPUm09Ii4q55gAk12keBlEa630OUW6Q1tf4MRf80F96FrZclg+jRSfJEFVn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417979; c=relaxed/simple;
	bh=kkhhh68MnUe1F7o+800Eb9eeejfqxDLyKRnivtm8cl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rHTu1RkmT+HAP32cY1I2XURIh6j3Q2AIRItJUAJQaWauFSq+nRIm0LCSTRzY9fqTpLZWfkxikpOsVHqRmAwCrvxM5R7KlaRiSkSqsvIisqUzLdaZxE9Ut546E+38CaZc0YMhcyBupgC1BUa3tOX8aymP9+o6nQ54brhEUabMTC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=ssLxE39T; arc=fail smtp.client-ip=52.101.125.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="ssLxE39T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=muor7VwgruzMkfOND+UknheTV8xeC9uskBqNBuyvVAww72pRLxDvtP7p4uXOcznQgXSOoYiYRPGyVkXDTqfV07K3+74xTMIkDrCaG5NUU/jTdT8uCynBU0acXAgjiNgBHuHPPYIeQlN+07iELKhl1XGhQrswRuoxunjhhJRluORK+og/hibwTQ02wg2JR4IaxtEkt/wdX8a75a5Ug28vm43ZfYX63+67kW5dSHwODMxVPzTGq8KGkswsFUGV+RvdnEBlBpjI/Zo98NrJjq06rWdo4npknAamEPrq9kh1EVqSRW2dG7nLJS9Ms8yhBS4vjGMj4QBLBSRfefRgdeN1qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWwbBmK4ZAp4paBXvlMv4kDa6Fli/8i7uKBlUxtGk+A=;
 b=oRaGXCc2vy1jXxtNyCnYrIP2ROqH19WQx5jrZpTGW7NFsmUgRSe3L1hhBTLkCmBe+k20iBZnGmsswjyoViCvMxz4ixBJoZphjTzPkQXh6sQ60c91Ot38yhzJWcpmNh4QQcFVv/QX3J/fKp+xOvu3SneM8XJ9zBlDMva3/+mR0yt3NnOtTVqEpc7xJ902bwObL8yWhxv7c8jcFqGu1bsHXt1zS24F3GZfIZRZVaZhHpKmlXu8MHoyAGQmsySL+XpAIOIh3y8bmjxAXxyJhVC35NNVSKGnLvWRMA8VE9WhxWHb0WA3krpOhJ/4Pw2Tm9MQ/CkVYVt0f8nmTxCSl8ttyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWwbBmK4ZAp4paBXvlMv4kDa6Fli/8i7uKBlUxtGk+A=;
 b=ssLxE39TS3rPOGfzfPlH6QeO0GrKkiPJR+/0yKBUn6yjaTJ8rh2nSVMe4EiOnlJE1J+vbQD8+tAEN8bavjHcSk2HEnXaGIpIamg07Gd4cbzhjspUDeQyMXb7E/5VcQOPUlKuKiUqmty3oSfc+MisyRLAhj2NC//fOYOvjdjDGF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OSOP286MB7980.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:479::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 06:45:59 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 06:45:59 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Devendra K Verma <devverma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dmaengine: dw-edma: Configure remote interrupt routing
Date: Thu,  3 Sep 2026 15:45:32 +0900
Message-ID: <20260903064533.2269557-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260903064533.2269557-1-den@valinux.co.jp>
References: <20260903064533.2269557-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0168.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::8) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OSOP286MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: babd42e8-27a9-4a8a-5aec-08df09870392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|376014|1800799024|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aCo7eG67zZdDPVuIevoASUOmA7sSmLr64olPRdI2MpyOgcb6xoG5xtIP9eHBdX4rER7ijqPTtEsWa+otGDdZeXuBSfupwJ4JYMaOFEzSsQchaSeOUOvi58Xlg6Z+VFEKZTt+0OHZXlTpr65+aRDNj3AgWNYZQKlLleuOQrh11Y/QJP68hCK/uRcji7JVpbhW2ezak59ZI3WL3jAGz1AlWJqCKVwYpsnsIReeUenP+NPmfopj1Z4ibfjCV4SV1bwCVeF6dW6sRZGjxj/kjg7PNKjHC+33dmgPJ9r+Iq1WLLOJaUtlWNlxT6WzERMOuU6ZcKbsSfYrJjrWreQrvr9Wc/11R9rMilZZMrySn1Rcxu3OFsEixdcY2lMhBMo69u+IW58vnuGv+REfKBxRjVAeoE5rB9QD7Fm9tKOe1TVkQmX3s9SdEOOMV0TWNe67lNwlTFb+5UnbuLvuCsh9Q4DGlSzCTohv6KAVNqm1W/j4z/38SenjirUrn5D0urXcYTcqOqghcNuGYd7lz84G8ZwG9axzU3s20flJRhYY/9wZRolEBXMhx6g+Kh4iRhi9bE87SniorDe97k3jW3QmY+JYdQoqynbCW6iVVHSwuOIWJcI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?de3+OwPyHUZYI/6k0uU4YQOHHBb64ZLUVVnkW5htSsOM7I/UkUHJL8BDtRp5?=
 =?us-ascii?Q?2+sndWFNmat1kcxJ9MplEEiv+maDBj/++GhjviGc1gEf3L70R/QZ83RzBad0?=
 =?us-ascii?Q?Ae91XUyyXXIc4lFY/e18kfy6LyldvKhSSjG3w44xW3T02ZliyYx/tzLXJdL5?=
 =?us-ascii?Q?vLGg+PjTXENOjO8ttGMYpFzQkMO8xZjBvRzD0mpITuTobwJoopbmdCeh+MDU?=
 =?us-ascii?Q?25DhKKjiIIM9m5locQ/nTXqNFF7F78ZmoUZlhZNq6jAjs971daNvV7sRVQVw?=
 =?us-ascii?Q?4xVXD289nDBG13qKLCSPWG3N7fKCp6QD4zveqr9qO+Yj7lZISevBfzQuRIoR?=
 =?us-ascii?Q?Qs3iutaP4CL4w4LPDVB1r0N0qmQjcaIW30Lp/qN1R2bOTQGzGxJq0CXmRieh?=
 =?us-ascii?Q?UTJZ2XL+AX54B6NVBBhKODdaPWdt+FntqsP7qfar9EbCaR8S0gk5RJVa7rMc?=
 =?us-ascii?Q?uExCkmZ8fM97vlzDQeM66hXa8OIWh6Y8do2A4BknO+4xZJTU0+6mSo6AQumK?=
 =?us-ascii?Q?PuLn4MCL+yHLwHmoxurjgJzoJMG4EZQDPg/MPMHGmVkEusSGXYjFIbOIELW+?=
 =?us-ascii?Q?g8H8BdExAdBxK5yXHuMgc9Wz+wHIZn9Qohxv4J9s6wEgyHikqekLu32/P0Kz?=
 =?us-ascii?Q?AFh+7vnCuu3fmwyO+vEMGcG379Y7t2n8uMp0+/t7DbitBX0HnbEJmV2DMXcU?=
 =?us-ascii?Q?KXmPLFL4tOeDg4r15LnnKaOwb4+yKc0Aj4ZF3bqhQqL3Igu+DEITTdihrbNo?=
 =?us-ascii?Q?Ghi7guf4vDxi88ZPNxv1TI8HLCdrDZs9aMSNH2GmP7IM0uuuYBsAGYCjlP9S?=
 =?us-ascii?Q?1kfJtiycE7TVP+qC4QsyABL+FMvUQTNQV9VSV7GsqFDF19iffjkHC3RzwwGr?=
 =?us-ascii?Q?1+YMKpTQpSWmWua9zRrEn/HY70u89MDL6vvL3MotIbEJW9hapCRepGVrxryh?=
 =?us-ascii?Q?kS1X6yQiokX0mpDT2jOrTH5+p6eGb3rRjC6c5MVxArWOxjXpINOvCoABg1P2?=
 =?us-ascii?Q?bawqNQJJu4duAR7yr7F4qX2ibz4KHgEiXp9dTd2yV4juTgbX6RrAKTPKoq+X?=
 =?us-ascii?Q?XyLMuwsiYOpWz2kSuoPYMzimXylnfQUSV+uA5dwqBaKU9rsUCjpYn7YXKJoP?=
 =?us-ascii?Q?ODcjFo5zasT/+lmDP9AxNoT8XVBD+6AqSWKwMIM9mEyg88dhwWIj2YpdWIE/?=
 =?us-ascii?Q?8KkmMErPW48KwK89cYZoj6+iKDXhtho0OApiipNWmCt50XoQZR0cLRj3bMkp?=
 =?us-ascii?Q?2n0mXmjuOkb5FC51xzWoobYJL7Xz7ToxPjnS7ibmCyMw22zeQjxeI4Tbhsdw?=
 =?us-ascii?Q?B+1BX8hL24S+1cr7P2XoRzUAeRamBNIGMdo7dQ1tDbJo4Sff10kPPQi2uq6G?=
 =?us-ascii?Q?mCL7p1JhliARH8yQUldEYHTJxTWKs0fSnYtyWoPzS1PjaWVWf/gW3pPh7HdD?=
 =?us-ascii?Q?sAiU9VqrbKIuL0XuUKWVeZWBCkmdZl91Jm5FUtoBpFLfg0TrR/iODTGK0ZAL?=
 =?us-ascii?Q?Jc2TJOPy/rPSJxddhgovUcgk2mHxq0fA/g8j/+9PzioTKuZFQToNDigtDBTm?=
 =?us-ascii?Q?WuxRE6tfyQiZoA5f6yutJKXco8o7650R3iOMY3A49FE5UUkMsMGD2Lys1Uao?=
 =?us-ascii?Q?UULiee5DoLqSNBlwp5pamDN8XF0+fYQdvZFxX5DhSxtNS90jQz8o1vQezpIe?=
 =?us-ascii?Q?CvZ95H7QVIG73j58XcedKDIgWgrSgiEBlFMvVCOjuWrSd2ByuPzcQ31iTupU?=
 =?us-ascii?Q?s1mp4Xuzu1EB5rnmhzazG8Uz9nCkzderZQ5zpYg+EcIw2sS0FqKy?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: babd42e8-27a9-4a8a-5aec-08df09870392
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 06:45:59.5604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fqQyYnCNWt5WsM7j0nNQe766Cyq+kw9j24avSf6JR08G1avVK03r92sUtx8EuGJ25ccTkb+njk2wrJaAKEYSNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOP286MB7980

An endpoint function can reserve an endpoint-local channel while the RC
programs it through an exposed register window. Such a channel must route
interrupts remotely and ignore them on the endpoint.

Use dma_slave_config to set per-channel interrupt routing on idle channels
of a local eDMA-compatible instance. Releasing a remote-routed channel
quiesces the hardware and drains its local IRQ before restoring the default
routing.

The eDMA quiesce may stop a complete direction. The caller must own every
channel in that direction and stop remote programming first.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - Add struct dw_edma_chan_config with validity flags for non-LL mode and
    interrupt routing. (Frank)
    https://lore.kernel.org/r/apWj7zzAw57U2r4F@SMW015318/
  - Do not skip generic dma_slave_config fields when private settings are
    supplied. (Sashiko)
    https://lore.kernel.org/r/20260828164950.61AE51F000E9@smtp.kernel.org/
  - Use READ_ONCE()/WRITE_ONCE() for IRQ mode accessed by shared handlers
    and drain the channel IRQ before restoring local routing. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c | 135 ++++++++++++++++++++++-------
 drivers/dma/dw-edma/dw-edma-core.h |   5 +-
 include/linux/dma/edma.h           |  19 ++++
 3 files changed, 126 insertions(+), 33 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index a678c70a78fe..e3786d960a43 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -177,48 +177,79 @@ dw_edma_get_default_irq_mode(struct dw_edma_chan *chan)
 						  DW_EDMA_CH_IRQ_REMOTE;
 }
 
+static int dw_edma_device_config_irq_mode(struct dw_edma_chan *chan,
+					  enum dw_edma_ch_irq_mode mode)
+{
+	if (!(chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) ||
+	    (mode != DW_EDMA_CH_IRQ_LOCAL && mode != DW_EDMA_CH_IRQ_REMOTE))
+		return -EINVAL;
+
+	guard(spinlock_irqsave)(&chan->vc.lock);
+
+	if (chan->configured || chan->status != EDMA_ST_IDLE ||
+	    chan->request != EDMA_REQ_NONE)
+		return -EBUSY;
+
+	WRITE_ONCE(chan->irq_mode, mode);
+
+	return 0;
+}
+
 static int dw_edma_device_config(struct dma_chan *dchan,
 				 struct dma_slave_config *config)
 {
+	const struct dw_edma_chan_config *dw_config = config->peripheral_config;
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
-	bool cfg_non_ll;
-	int non_ll = 0;
-
-	chan->non_ll = false;
-	if (chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE) {
-		if (config->peripheral_config &&
-		    config->peripheral_size != sizeof(int)) {
-			dev_err(dchan->device->dev,
-				"config param peripheral size mismatch\n");
+	bool non_ll = false;
+	u32 flags = 0;
+	int ret;
+
+	if (dw_config) {
+		if (config->peripheral_size != sizeof(*dw_config) ||
+		    dw_config->flags & ~(DW_EDMA_CH_CONFIG_NON_LL |
+					 DW_EDMA_CH_CONFIG_IRQ_MODE))
+			return -EINVAL;
+		flags = dw_config->flags;
+	}
+
+	/*
+	 * When there is no valid LLP base address available then the
+	 * default DMA ops will use the non-LL mode.
+	 *
+	 * When LL mode is the default, clients can request non-LL mode
+	 * through DW_EDMA_CH_CONFIG_NON_LL.
+	 */
+	non_ll = chan->dw->chip->mf == EDMA_MF_HDMA_NATIVE &&
+		 chan->dw->chip->cfg_non_ll;
+
+	if (flags & DW_EDMA_CH_CONFIG_NON_LL) {
+		if (chan->dw->chip->mf != EDMA_MF_HDMA_NATIVE)
+			return -EINVAL;
+
+		if (chan->dw->chip->cfg_non_ll && !dw_config->non_ll) {
+			dev_err(dchan->device->dev, "invalid configuration\n");
 			return -EINVAL;
 		}
 
-		/*
-		 * When there is no valid LLP base address available then the
-		 * default DMA ops will use the non-LL mode.
-		 *
-		 * Cases where LL mode is enabled and client wants to use the
-		 * non-LL mode then also client can do so via providing the
-		 * peripheral_config param.
-		 */
-		cfg_non_ll = chan->dw->chip->cfg_non_ll;
-		if (config->peripheral_config) {
-			non_ll = *(int *)config->peripheral_config;
+		non_ll = dw_config->non_ll;
+	}
 
-			if (cfg_non_ll && !non_ll) {
-				dev_err(dchan->device->dev, "invalid configuration\n");
-				return -EINVAL;
-			}
+	if (flags & DW_EDMA_CH_CONFIG_IRQ_MODE) {
+		switch (chan->dw->chip->mf) {
+		case EDMA_MF_EDMA_LEGACY:
+		case EDMA_MF_EDMA_UNROLL:
+		case EDMA_MF_HDMA_COMPAT:
+			break;
+		default:
+			return -EINVAL;
 		}
 
-		if (cfg_non_ll || non_ll)
-			chan->non_ll = true;
-	} else if (config->peripheral_config) {
-		dev_err(dchan->device->dev,
-			"peripheral config param applicable only for HDMA\n");
-		return -EINVAL;
+		ret = dw_edma_device_config_irq_mode(chan, dw_config->irq_mode);
+		if (ret)
+			return ret;
 	}
 
+	chan->non_ll = non_ll;
 	memcpy(&chan->config, config, sizeof(*config));
 	chan->configured = true;
 
@@ -890,11 +921,48 @@ static void dw_edma_wait_termination(struct dma_chan *dchan)
 		 "timeout waiting for channel termination\n");
 }
 
+static void dw_edma_synchronize_chan_irq(struct dw_edma_chan *chan)
+{
+	struct dw_edma *dw = chan->dw;
+	unsigned long *mask;
+	int i;
+
+	/*
+	 * With nr_irqs == 1, the common handler can enter for the other direction
+	 * and retain a status snapshot for the remotely owned direction across
+	 * quiesce. With multiple IRQs, the handler covering this channel can likewise
+	 * enter for another IRQ sharer. Drain the IRQ whose mask contains the channel
+	 * before restoring local routing.
+	 */
+	for (i = 0; i < dw->nr_irqs; i++) {
+		mask = chan->dir == EDMA_DIR_WRITE ? dw->irq[i].wr_mask :
+						     dw->irq[i].rd_mask;
+		if (!test_bit(chan->id, mask))
+			continue;
+
+		synchronize_irq(dw->chip->ops->irq_vector(dw->chip->dev, i));
+		return;
+	}
+}
+
 static void dw_edma_device_synchronize(struct dma_chan *dchan)
 {
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
+	bool remote;
+
+	scoped_guard(spinlock_irqsave, &chan->vc.lock)
+		remote = chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL &&
+			 chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
+
+	if (remote && dw_edma_core_ch_quiesce(chan))
+		dev_warn(chan->dw->chip->dev,
+			 "failed to quiesce remote-routed %s channel %u\n",
+			 chan->dir == EDMA_DIR_WRITE ? "write" : "read",
+			 chan->id);
 
 	dw_edma_wait_termination(dchan);
+	if (remote)
+		dw_edma_synchronize_chan_irq(chan);
 	cancel_work_sync(&chan->irq_work);
 	atomic_set(&chan->irq_pending, 0);
 	vchan_synchronize(&chan->vc);
@@ -903,12 +971,17 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
 static void dw_edma_free_chan_resources(struct dma_chan *dchan)
 {
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
+	enum dw_edma_ch_irq_mode default_mode =
+			dw_edma_get_default_irq_mode(chan);
 
 	dw_edma_device_terminate_all(dchan);
 	dw_edma_device_synchronize(dchan);
 
-	scoped_guard(spinlock_irqsave, &chan->vc.lock)
+	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
 		chan->configured = false;
+		if (chan->irq_mode != default_mode)
+			WRITE_ONCE(chan->irq_mode, default_mode);
+	}
 
 	vchan_free_chan_resources(&chan->vc);
 }
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index f6a5ad317567..275d362d1805 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -280,11 +280,12 @@ static inline bool
 dw_edma_core_ch_ignore_irq(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
+	enum dw_edma_ch_irq_mode mode = READ_ONCE(chan->irq_mode);
 
 	if (dw->chip->flags & DW_EDMA_CHIP_LOCAL)
-		return chan->irq_mode == DW_EDMA_CH_IRQ_REMOTE;
+		return mode == DW_EDMA_CH_IRQ_REMOTE;
 	else
-		return chan->irq_mode == DW_EDMA_CH_IRQ_LOCAL;
+		return mode == DW_EDMA_CH_IRQ_LOCAL;
 }
 
 #endif /* _DW_EDMA_CORE_H */
diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
index 3c8e2ef9dee0..93f866d57987 100644
--- a/include/linux/dma/edma.h
+++ b/include/linux/dma/edma.h
@@ -101,6 +101,25 @@ enum dw_edma_ch_irq_mode {
 	DW_EDMA_CH_IRQ_REMOTE,
 };
 
+#define DW_EDMA_CH_CONFIG_NON_LL	BIT(0)
+#define DW_EDMA_CH_CONFIG_IRQ_MODE	BIT(1)
+
+/**
+ * struct dw_edma_chan_config - dw-edma channel configuration
+ * @flags: fields selected by DW_EDMA_CH_CONFIG_*
+ * @non_ll: use HDMA non-linked-list mode
+ * @irq_mode: interrupt routing mode
+ *
+ * Pass this structure through dma_slave_config.peripheral_config. Before
+ * synchronizing a remote-routed channel, the client must stop remote
+ * programming and own every channel affected by the hardware quiesce.
+ */
+struct dw_edma_chan_config {
+	u32 flags;
+	bool non_ll;
+	enum dw_edma_ch_irq_mode irq_mode;
+};
+
 /**
  * struct dw_edma_chip - representation of DesignWare eDMA controller hardware
  * @dev:		 struct device of the eDMA controller
-- 
2.51.0

