Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020093.outbound.protection.outlook.com [52.101.229.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6323B43031F;
	Mon, 27 Jul 2026 17:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171824; cv=fail; b=Hs59qRjXRpc3QQI+BwjkSHRVLuz7BXD6LfQK8Wdd19mAEBH6Q+bAxon3+Gd297n89v5HEfVxdZmQYcNmkQOTHGlAm5Bcgqvwsx5LazOpcCuCYCrIlwinXkBdDFvw+064tup61l9/gw6i1+BLkJ1UuPb/+ZCoAvLohPMX3k5GUDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171824; c=relaxed/simple;
	bh=FUqmMHUXH1DwOcNC4qJaMSxit6kYe6Qt61c8V++JiHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aD83pXEp26sS1ojXmhiEFg0lvUAMVx8e9i3rBbPuwuZQGyq5dkw8Ym9iMoS0JRjesSanTbBK9IZaB9v6p7c6TnT9oUs8UttWNPRsgZjSV5e1GpK0qZBAxHG9O9/UjxMRNlrRr7AgWmmIrXuKg35PPLVEfEv04cV8FNoeqov/yNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=wdcBPnXy; arc=fail smtp.client-ip=52.101.229.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="wdcBPnXy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KfAh4KtR3NsYj9wjs9Hg7ICmMJhemDFemeEs0WyNKa0rkpGl1/mu2uvZA2iBf3mSn90uWeKPbp9PH4QAGhSaOR2yRsR1VKZWYjKLcMqV8GcixzJXGMxDFRYY9pkmF6s/zKsyYhUcoUAajWykoMtXEyS1LFcbYbDl9/l2E8NzgFFYMLDAfhP1oZbOu4AyOoCgxXsSAKgfQiRwLj2sh3W+uTrm23XxfbjehjblSIXCDqm4HQIUWc5EUKtj14gpCeXxb5Bbz2B/sQCWDaJD0U4eaxNgrcplPcOI9saf1Rbtks9WJ8ZC6NX58iVhjSIm48Ch/rNSQKgBvUamqfA3t/emRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnMjzFLzNbO+O5g3ZDIg11PqsXrymipzzDW/5s7JelE=;
 b=hmxkbGLzbIdwpagAso0hJONwQCbnBnSwyFLMTDOTWmA9EzPp5i/W78qdBpPcdLa57Gu8ZoVxuQ0SGmWRmVSAy+6stEM5BH10L9hdz8rGUvTAcUhpoa5i0GqQJUxF1rvJ127WHjoeaaE888u+q55iEI7PRuLETsnovccuPosPx7P1C+YTIdNP7Nw5JH1EUyuudUfqANfjSVguRPhuho0qhUgTycmU8TRBYmNYlrLApqqz/2YcCRYAvw8u/mruf/R7RkFhqe14GzY+C7U0xsnx5qQEcjXozAeuX6GN6MJM2sRxeAm6IyBXcmLgS5zkmxH6kZzIKiKMSjsGIob4qoE+qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnMjzFLzNbO+O5g3ZDIg11PqsXrymipzzDW/5s7JelE=;
 b=wdcBPnXybGi7KwbUhpESYv2TprOWSC/J8l7jCLO0KHWTlqiB4+RxbuQVtRst2PbvA3By/LM+nrG2oEbzPWHGNe6w2F+SpLN/QpzdsDUnjpX4bnEo9eMvolZUrWkG7fcO0vrrAk9XfewqdBwbPBDoNPeyDT9emYWYBDUdrst6Ox4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4609.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 27 Jul
 2026 17:03:37 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:36 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Christoph Hellwig <hch@lst.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Niklas Cassel <cassel@kernel.org>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/24] dmaengine: dw-edma: Centralize LL doorbell decisions
Date: Tue, 28 Jul 2026 02:03:06 +0900
Message-ID: <20260727170323.2321369-8-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0145.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: 760a4b9f-2611-4f19-ad7d-08deec00ffc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|10070799003|18002099003|22082099003|10067099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	eZ2gvDHp7lm1JAFFMW7DX7LTWjvH5sjRHkwfFjllxem2i+rzOMDnvKwqFRvXf0b4J8TIwbp6lKSN5g+4f43J+nqTIIDMMG1WGWMGUQxiuBhCoxgHt+uemRDJMADf9C+3GcX/AH9L4CaHAbWsdMDP0IW2GlVW6vpyboi2ti9Aan/S50xq1g8C/ZqF+DJ/YtTP8rZ/ZI3lLr7F3FFAqQElWGiQkFKAc76+s2Z69M7QlkcJqk1ufFf4V9zpGDz6Wt7ISXMao45gQhn+oDO3XsOt2MpGdSsYDAwes/6iYSXf+dHP5q5av2VV6o+sjCZo6fV5d2FpbVloGmWcYDmJ8PF5NxXs7GKTg0PjZ40/BtA1+SOlUuNtdM4gsmtGqZpkc3Gydb6bKWhLq8QRk5hURgKgTJoxBG3xwVSxPwJx1vJdG3wzlljig0lYL9WrSHqLOxBDxwAIfV70tE/zXHKKZIU799eTU8p88mWttTckE8ceLEFAIpKolNyUX6pYsqiBBhsv9gldomrooNJVEo/UFv/2QybuubkcpY8Km3UqbRupjpF9L0/2Mna7c/SfEhCVf0FfhtQV2E5k6zNCdTCsbJm4rwoj/MJMgNU6t2SlsxxOKo6xgndUzuTmPnhosfVTVFSXyMzX5ZuJ8L6vv9p+3fo39D9lPgUAWABMgrDPOKDhWDeDo3JsDUzSUYK7dydynRpMLDeDKuSRthYGAfdsJg2YfQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(10070799003)(18002099003)(22082099003)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QipXJCvhDU29e6F9ZVwhWUYOq9znlYLMZAHxyjKd0dA6OK+dC5mhqWDo6DM/?=
 =?us-ascii?Q?jtaQoCVgmv/YbWygYox2RoAhqG8io6cWjiHfnP47JCYDrVyBBdBlKfbAvx3o?=
 =?us-ascii?Q?o865WY26LHd7KGTPBTSiVBgwV5/ZomEpcKThI75d0GrtfrU/szscaoyhs1n2?=
 =?us-ascii?Q?rbHSzu8uCIW0hKlUmVXILZPvfpU9uxgbkoanMhCggcgv/LrTsurL2dio6gJE?=
 =?us-ascii?Q?/m+WVNnyGN17cx7+PLgSxgyf5rR0BUOH7/4a2RvnOO9hO/ecxMevZ60OLfFK?=
 =?us-ascii?Q?hvBhd5pZLWjL4mGZcfuN2SbhIim+A57HVLTWhbyTOeGJNdhDymaYP6ZviDUO?=
 =?us-ascii?Q?wEOUPS0i/H7m/GW+kGEc7a9YOtT6MFAtRj10SMRvQzWT973BBqniUm9iuUd6?=
 =?us-ascii?Q?WoL+pso9lXVYv5weDy4av5VIEyC1Jh7TfY7DcXU9ZvH6UatXBi+64HO/cBHc?=
 =?us-ascii?Q?MGc6TMMvVpJUaB+PCJngFMprPWCWvFd9ctfrj07BFiAn99HhhNqF6ywcfWiA?=
 =?us-ascii?Q?JEYxq2PSpaRn9CmfNUGwmUmGdkdP+mr2HlwvGyf8gGgPIHnerOfxkdqcBPGC?=
 =?us-ascii?Q?mTl9j1sTCwQZO7QPWENg1BpQbmRKIJ4k0c2KmNf13EGIn5MRc7vcrrdqo0FK?=
 =?us-ascii?Q?8K7wFSU1dg7xIgVW2BqZYN1xS++UsamWvOH4JbnMkGoy2uS2Y7J+JOxNC3tw?=
 =?us-ascii?Q?LTWVOcEOZBlEOp37/0y8DuKdy1IOAbXjoCVzbnKSWDd0zpqKWVqTUJcNgxjW?=
 =?us-ascii?Q?Q8dBJyY/ROnOLA7dDg7ekc6f7e4/qZ1bJWI0ztzDWVdHKHVCkrymws5q2iNQ?=
 =?us-ascii?Q?CzUyLCtEuXHqpTDK3oqfwBN9VSSSSsL++ySnZFlkGP9j2SWek6Nz551epMje?=
 =?us-ascii?Q?QpVbHhe772PWegmCcNxFvNfMUXeZYGqFmcGrvkTOh+bAFNOWVMH1Fm3ikvnq?=
 =?us-ascii?Q?sYFmXOSfvwUI8wIcp0QEi950dhfc2EqGiqm4cG7zqVbISyc/XjPHGBqqdt3J?=
 =?us-ascii?Q?DWxZBDgU2LeioPRaxc7EZvvG2upoM0gvBLOvAXiCecvOsPzHOjV3jTHRBUWv?=
 =?us-ascii?Q?By9lYErY92voCETajBBnAwe8ys6+LLxd9fqHJmx0/klGPtXydox2ndjtWYGE?=
 =?us-ascii?Q?dC3IYZJAb4HjacEtShePN+NoW0VwTw2AS/sEl66XE1wWfkp5HLhf8+fUHRPk?=
 =?us-ascii?Q?fnK3HUWFK99E8iJN2eObpgDNVWeIB7WjXZCk9KL/naHp3EbIfKnk7Xe7RGO8?=
 =?us-ascii?Q?DUpA5yYocevk3iWatEfdGOC1AUUW4O8XLgGu/5qtqJPNCRanc7TP/lAZQaLL?=
 =?us-ascii?Q?wZRKUOh5lkSCLCqEVU/xc9HEaIm3WFeAevw5S0WVJKQ3ahUGQ2fwv8VVaHyp?=
 =?us-ascii?Q?+Y6p35gtPx3EGi/rJirdVAMLpIjf1PzhEsQBUUnnId57mITBhZoxP8S9QYmL?=
 =?us-ascii?Q?AGaRjbJUvBtQmpmGgPwEVKlTmAAHZHlrhV+f6UErFRKlrDd6QtoynutfISSL?=
 =?us-ascii?Q?7K1HM6TcSbai5/GGxZxz0CzvTs1hsMRVx4pcQH1RluuRuZsWznobxZ4ERqDM?=
 =?us-ascii?Q?RJX5V1O2dfAxJeZd/FFkRmPXF15Zu3TS3e2jWsTNlqcaxz174gZSlO99kgL5?=
 =?us-ascii?Q?L8OCbX/z3TCVxwGNGyjGjafwR7U3sgbzGS9uQfokMkpnHFYtuMEdNaJ5e9r8?=
 =?us-ascii?Q?FlGVM05Vd9qtq+KaMbawdFP+1Ky6CS/Ft8Wi+4QCDmZuvGLLbDQdVUrgqSt9?=
 =?us-ascii?Q?y9S/xiWnLCZS43ofl+GJyZkO8P6KI2UQX+ikWtThjdNHjAQ3rvKf?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 760a4b9f-2611-4f19-ad7d-08deec00ffc5
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:36.8982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aq6JthLArcvlkTRIbYDwzzchOcUdDTc8tlv7dq1ngKCJTiE9XHeYs4lyGPh5x5hRnhAFiUbuF6zFq/luymRpXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4609

LL fill currently rings the doorbell every time. A running eDMA or HDMA
channel follows entries whose CB matches CCS without another kick. A
channel stopped at a CB mismatch needs one.

Move that decision to dw_edma_core_ch_maybe_doorbell(). It rings only
for a BUSY LL channel with pending entries, no EDMA_REQ_STOP or
EDMA_REQ_PAUSE. The BUSY check prevents EDMA_REQ_STOP completion from
restarting terminated work.

issue_pending() still publishes LL entries only from IDLE. A later patch
allows live appends. Non-LL channels are unchanged.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - Keep status gating out of this preparatory change. Add it together with
    the stopped-tail recheck. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index b419ff2becf9..c036510dabcb 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -167,8 +167,6 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 
 	desc->done_burst = desc->start_burst;
 	desc->start_burst = i;
-
-	dw_edma_core_ch_doorbell(chan);
 }
 
 static void dw_edma_core_start(struct dw_edma_desc *desc)
@@ -249,6 +247,16 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
 	chan->status = EDMA_ST_IDLE;
 }
 
+/* Must be called with vc.lock held. */
+static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
+{
+	if (chan->non_ll || chan->request != EDMA_REQ_NONE ||
+	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan))
+		return;
+
+	dw_edma_core_ch_doorbell(chan);
+}
+
 static void dw_edma_device_caps(struct dma_chan *dchan,
 				struct dma_slave_caps *caps)
 {
@@ -374,6 +382,7 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
 		chan->status = EDMA_ST_BUSY;
 		if (!dw_edma_start_transfer(chan))
 			chan->status = EDMA_ST_IDLE;
+		dw_edma_core_ch_maybe_doorbell(chan);
 	}
 
 	return err;
@@ -420,6 +429,7 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
 	    chan->status == EDMA_ST_IDLE) {
 		chan->status = EDMA_ST_BUSY;
 		dw_edma_start_transfer(chan);
+		dw_edma_core_ch_maybe_doorbell(chan);
 	}
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
@@ -733,6 +743,8 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 	default:
 		break;
 	}
+	dw_edma_core_ch_maybe_doorbell(chan);
+
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
-- 
2.51.0

