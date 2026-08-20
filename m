Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020105.outbound.protection.outlook.com [52.101.229.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C7F489861;
	Thu, 20 Aug 2026 17:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247301; cv=fail; b=prKw4wv4EVkU6y8kEtOvF10LRl+0vrA2zcm7clpeiEmNjkMvLZd0GNWOE5cVWu3MbrFKf2wLG+RZ3Y6zIch7iIqBT9H5f44nBXJOf2QfhcrRgZwdmtIsOT6VK/RccimPBPgiOiyippq+OiGMimr74KZJn5gZ5/2dQpAnDkuo0lg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247301; c=relaxed/simple;
	bh=lAp4kaFlDHCYxbl98cYeseYpdr/W7rrFg1XQYqSIAQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R+AXunSI1/0+aWT6H7DxL3o6Vunw+MyEmmAQxRbwTbYuuM6/XjzeF3HE8wBaPsZbkBvLkmGxgpskfEzy6CAXiGvWNSV3dnk3dFs8UvRtNCZ34Evw9RneRPCaYjPR7G9vHjPRy8984laz70jFnYdhSxwR4R0yYrML2GibfXsmqpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=f+5RIr/b; arc=fail smtp.client-ip=52.101.229.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="f+5RIr/b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pz02dvJnHVFT7nk0MdWjLUiBkeke6vjH8hNjE0DaHYSGpicElpeZ8APDO0EQJX7ci86V54MCc4FeEVze2mOZeu3+Ce2lRz9+uPhGN8qV35u+7Vlbu9cYNQQJsKGBsT43Xj7tkQSk5BEfHevhl2yCOt3Ub/srvDKcfsGsMQO3nGBB/b4JNA0QluQglzk1pzBusyaW8dHgGwM3Q3gBcyrsKh5ij0cJdV5RYjsdBz9CIjoD3ETLek6p9d/B1D5VvwDxDVdv3qFMmwAjdJLCioelP7zV+L67vHhCYz7cb4R7SEijYlET3hI3z8AC1/iK3vJF6f3pDSp76QwwpGet3FCCrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WhM8JRbTiMLxVAni4SWpORUJ/vDFvnSq5JxFq7Mv3s=;
 b=yitHEjd42B50tAqhmBPtObR2v2bAz3aq8NnuqZqU+A9aCDCWtOPegXioCbf4OAGYbvukKiLuOQZIyujgaNxcBD8xyYy6hlixgsOZtg6W1GjAJLCnw+t75w2JIvWwaknt9ht1ENQ/TL5GRlCyuqOXFg5G4jAf++uhQpQZk8Hc/SMpx/70A6XHezr9YHvigxzHkhz0uQZo/YL2jH9VWepv1K07L5nPS7TKQrl3gJdWPhZFYpQiAr5JlQKu3pWad4UvAShmDNlCVHpuhWezBdFIanS0vR4yLKT6eUnPbkhSHnjEdRPNbbNnpFfbJZw+M6D7oVPPLKsEz+1TtNPKh7B9Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WhM8JRbTiMLxVAni4SWpORUJ/vDFvnSq5JxFq7Mv3s=;
 b=f+5RIr/bZVlI0pdsirFs4wlNsbXYeuezRFIATrPF1UZNpWYXA7ONtvtIojjS/5s1dFnUlK50jFOwNQ7t8R0i6ntd+cVKlXKBs2w3easDBTVGkfRf4r/GVVHv1bkCI7uMjHDUpJuaVWINPbEv7XRLdgWPJCUTLRoy+q69oznM+94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7644.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:461::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 17:34:57 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 17:34:57 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
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
Subject: [PATCH v6 09/10] dmaengine: dw-edma: Prepare deferred IRQ reporting for LL events
Date: Fri, 21 Aug 2026 02:34:38 +0900
Message-ID: <20260820173439.2004068-10-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260820173439.2004068-1-den@valinux.co.jp>
References: <20260820173439.2004068-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0271.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::16) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: 349a2b77-1279-4271-f96a-08defee15ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|23010399003|1800799024|366016|921020|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UOWrTFb1ZnSNvfgP7hUWEEZ1Rcp/93jAscErTLwPnmk5ztN/41X51xXSLdjISac1XV2/RlUfenhcAx8jjGC3LBxnWTUoZhhvW1HBNkLT4lmWf8UJR0mY1/FXNY5/WCJvUFQpiHk+iDNcNiG7DYtbTonbdbrw9j/+t5iShXWCXAdMzqG919j3HUHiopCc6vrZtuSyDOs7FEGU5/ettZXzUqjecoQT9UfbLyjPaDta9fY195zGfPjZ67nPE13K+Iji+BZd/bePDWvyuY7KGICwRa6N87HSx2VkQnglg9XFlosRl1g2cHK2g0QUnLOvv4XBf1y5mHr69s9v9m6VJj/b2bobROyTfxxRb4Ey4q2xJsiRrhYYz9DCSjhJHQAZqjSIR8fV0qMBBKv9wP5XhAZi799qqDYodpfunLGUETemzHj6YsWYAr8vSFYpYA3pTEMS8FuMtsJ38/oKxEtgUR5DwAVAxCwS/PxGG9XWeHM9QNBxZxzqylK4KJUutDvjbwjJEfbmeeJi9RyHvv5ny7u8Uc1+jA8RP80gF8KZ+RY9xmvyIWauBXPyVlEgw94SbhWjZyBWnAhRGlEcOgPS6OV8cEMgsKOE1175v6QimQN9B/mJNv472xGHYeHAKqEC/RIQX0gUWJeprl+mSD/eYdJ4TnI+NtQd+Vuobgt0HuZfM+VtylrOVVFLFCpxD3mKLcvQMUd8SgDgdY5gjDE6bis7xw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(23010399003)(1800799024)(366016)(921020)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8Qzl9CIj6BZPFX1tjPPr2+fyHSgyOklEKQxEB+eQkaf8JSK/VsXHRvWS6vN0?=
 =?us-ascii?Q?qUsvF1scZ+F8ee6ZzPpAFOmIoIGu1OU+TZkH4bqFRPPMV7LphtO+6vZKsDnt?=
 =?us-ascii?Q?64zXqxx06eSEt7UHMhRvBQJ2ClsvQFk8quQT/ovwQpgMdfRVe0UsrIAeW4Qk?=
 =?us-ascii?Q?O4gf8Dt+pGaPDx7GvPXTinDFdF84jqcikrnRuYkb7Q6DbXpHuVu5A5oWJE0R?=
 =?us-ascii?Q?m3q7esSS4RU90yYEze4fIT6xak3vuPS0YvZdfYBcZk5iVOJUJGhkXNlRqlpb?=
 =?us-ascii?Q?7+dhX6mQpzAUK1X89wanV6nGX6lKxXONMVNAD1DcWdYdVWV+N7Nq9ak/c9V0?=
 =?us-ascii?Q?xHmSlTtshOtj20lI/3+tEVjNTmRDFI+h1FkRZMiopIDw1/iguD4TzysJK/wq?=
 =?us-ascii?Q?XyUS/yPC/nAOL233pZGUVnl2SzgCR0XXlOiGxFtirSn5F7axPNhjFhQixblj?=
 =?us-ascii?Q?AKh9rZNP0RtrwSwvFrWcyQSNMYo+bmawaZ4UUByWsqrs8x+GSj1mzsZ1BCOb?=
 =?us-ascii?Q?nwTcEYfMPbWyz+OtmepPnSPY3u/8cOLzgw2xLuJfHKIL6B3Q+1Fsz17VwO4p?=
 =?us-ascii?Q?d3oORvg4Sxp92PK3UdqQxNF9CnHyEqPV2ZIIf1TkMXgU53JmU+rfqNvNo7Wb?=
 =?us-ascii?Q?Guovzkqdn7WdaTksFh8An0Gke1sULToLqDg4W6I4GtsNDbp9YyUaa97ZMh+7?=
 =?us-ascii?Q?D7WB780Ny66j7p1DUxTgB//N63KnLYsmZRhwKY2OcuhrTYVk+M9wMOYIsn2z?=
 =?us-ascii?Q?yk2fnZQ+9VuGHuMchPULlWYgLmwmCgKCvC2sFaw8TUIH7B6oR/kCpCx4z4Z0?=
 =?us-ascii?Q?aGBvbjbMUDSGjldxRmEgnwW6swed/6CaERWOYh8Dm60kzAPJwO9WB+EHCp2W?=
 =?us-ascii?Q?LqjOu1pJ0xfNjv3pYGDaVj6wBOkw43+pIvnM2sLugfowwRvngga2rv4Cre88?=
 =?us-ascii?Q?tpYf5cKLXIQXrQbISmFRhC23dua9iFtJEC7l0C0ZV2so2dQKHsp6r6QB0Vsd?=
 =?us-ascii?Q?WVxD5fgYJCTRdfe8//ghJ3fkeV4y6YvLhp+tkhNshRylkcdpn42Oy3/aphcS?=
 =?us-ascii?Q?Qxu3MzA7JguiwbREGAlD5fbN6ZrkgGrC96Ev2IV1s6BF70ka9WUOdakcF9kK?=
 =?us-ascii?Q?KVdsgiVKc7vLcgCj0o50uN8x2r3NU7DgKEdB3Q3yDOW71oUA22/L3bKGRF27?=
 =?us-ascii?Q?7rxS9CWLePDBgaTG2R8Def+s91JebcCUZ2l7+pXheRRuhljCGO0qTaZB83X4?=
 =?us-ascii?Q?bTV4bi2Fky5wTGvu/t6xvEybkan7iMvjm53gxiLLxo5L/4jMAh63sYEB2h9A?=
 =?us-ascii?Q?+BQjq6T79Woq/M33TJOdkMMBcIKBJEzdf5k3mB9x79EH3/PcOmRMzqZwd4rY?=
 =?us-ascii?Q?wA5iHT/jPow6e56ZVij59OHumrQCe+bAjCaWdMFtjgSQ3y1gLD0B9gyyuIcT?=
 =?us-ascii?Q?UKBajosWCPy2GotUfhuyhYbu/PJDs86F0HjnrX84/l/fo7RUF3L1hS1VClBQ?=
 =?us-ascii?Q?/Il1EuVr+WzdeFlbqan0t5pldimIpWShUm1T1CALzawl3UhoYU9m9/6YmVF1?=
 =?us-ascii?Q?kDga8F0jWS0w5a/Kf/nhUeIEMi7NptZxx8LVESDxR9JGsVrzYsldCFY8Phsi?=
 =?us-ascii?Q?YkW/4kYSa2uk5sgi/lfuWyO2EjcKbeQOuHMt4Yk6cfTdIazMoYc+kW8YMx1w?=
 =?us-ascii?Q?OZUmrQHKmo/OCc0VcHMtBbacPah6rQwvb7qjKcAZtOroYQyT4Oy9L5KvCtJq?=
 =?us-ascii?Q?nkG0AnCRd2dOtNoCx5YY3LfkDFl6EEfvEqBl37neuhJUR/uzk05H?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 349a2b77-1279-4271-f96a-08defee15ac1
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 17:34:57.7595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8iee0sFdgJvQEf6Dyoq44EFudyRCkmPSWSJrD9G2I6kvf9n5f9jr0z4YJu3yUm33cXJFcXYAWcCgwC8AartlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7644

A later change serializes status capture, interrupt clear, and event
recording against channel restart. It must also publish all causes
observed for a channel in that critical section through one callback.
Otherwise, the deferred worker can consume one cause before another from
the same status pass is recorded.

Replace the DONE and ABORT callback pair with one callback carrying an
event bitmap. For now, map the bitmap back to the existing deferred DONE
and ABORT work, so behavior remains unchanged.

Also split DONE handling into a lock-taking wrapper and a vc.lock-held
body. The later LL event path needs to validate its recorded event under
vc.lock before running the existing DONE state machine.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/dma/dw-edma/dw-edma-core.c    | 44 ++++++++++++++++-----------
 drivers/dma/dw-edma/dw-edma-core.h    | 16 +++++++---
 drivers/dma/dw-edma/dw-edma-v0-core.c |  6 ++--
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  6 ++--
 4 files changed, 44 insertions(+), 28 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index bbfd82b12ab5..97de0ad4489a 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -702,17 +702,16 @@ dw_edma_device_prep_interleaved_dma(struct dma_chan *dchan,
 	return dw_edma_device_transfer(&xfer, dw_edma_device_get_config(dchan, NULL));
 }
 
-static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
+/* Must be called with vc.lock held. */
+static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
 {
 	struct dw_edma_desc *desc;
 	struct virt_dma_desc *vd;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
-	if (chan->status == EDMA_ST_PAUSE) {
-		spin_unlock_irqrestore(&chan->vc.lock, flags);
+	lockdep_assert_held(&chan->vc.lock);
+
+	if (chan->status == EDMA_ST_PAUSE)
 		return;
-	}
 
 	switch (chan->request) {
 	case EDMA_REQ_NONE:
@@ -751,7 +750,14 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 		break;
 	}
 	dw_edma_core_ch_maybe_doorbell(chan);
+}
 
+static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&chan->vc.lock, flags);
+	dw_edma_done_interrupt_locked(chan);
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
@@ -793,20 +799,24 @@ static void dw_edma_irq_work(struct work_struct *work)
 }
 
 static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
-				   enum dw_edma_deferred_event event)
+				   unsigned int events)
 {
-	atomic_or(event, &chan->irq_pending);
+	atomic_or(events, &chan->irq_pending);
 	queue_work(chan->dw->wq, &chan->irq_work);
 }
 
-static void dw_edma_done_interrupt_deferred(struct dw_edma_chan *chan)
+static void dw_edma_record_irq(struct dw_edma_chan *chan, unsigned int events)
 {
-	dw_edma_queue_irq_work(chan, DW_EDMA_DEFERRED_DONE);
-}
+	unsigned int pending = 0;
 
-static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan)
-{
-	dw_edma_queue_irq_work(chan, DW_EDMA_DEFERRED_ABORT);
+	if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
+		      DW_EDMA_IRQ_STOP))
+		pending |= DW_EDMA_DEFERRED_DONE;
+	if (events & DW_EDMA_IRQ_ABORT)
+		pending |= DW_EDMA_DEFERRED_ABORT;
+
+	if (pending)
+		dw_edma_queue_irq_work(chan, pending);
 }
 
 static void dw_edma_emul_irq_ack(struct irq_data *d)
@@ -907,8 +917,7 @@ static inline irqreturn_t dw_edma_interrupt_write_inner(int irq, void *data)
 	struct dw_edma_irq *dw_irq = data;
 
 	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_WRITE,
-				       dw_edma_done_interrupt_deferred,
-				       dw_edma_abort_interrupt_deferred);
+				       dw_edma_record_irq);
 }
 
 static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
@@ -916,8 +925,7 @@ static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
 	struct dw_edma_irq *dw_irq = data;
 
 	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_READ,
-				       dw_edma_done_interrupt_deferred,
-				       dw_edma_abort_interrupt_deferred);
+				       dw_edma_record_irq);
 }
 
 static inline irqreturn_t dw_edma_interrupt_write(int irq, void *data)
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 8d993e8cccbb..30b508eb3e3d 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -41,6 +41,13 @@ enum dw_edma_xfer_type {
 	EDMA_XFER_INTERLEAVED
 };
 
+enum dw_edma_irq_event {
+	DW_EDMA_IRQ_DONE	= BIT(0),
+	DW_EDMA_IRQ_PROGRESS	= BIT(1),
+	DW_EDMA_IRQ_STOP	= BIT(2),
+	DW_EDMA_IRQ_ABORT	= BIT(3),
+};
+
 struct dw_edma_chan;
 struct dw_edma_chunk;
 
@@ -147,7 +154,8 @@ struct dw_edma {
 	const struct dw_edma_core_ops	*core;
 };
 
-typedef void (*dw_edma_handler_t)(struct dw_edma_chan *);
+typedef void (*dw_edma_handler_t)(struct dw_edma_chan *chan,
+				  unsigned int events);
 
 struct dw_edma_core_ops {
 	void (*off)(struct dw_edma *dw);
@@ -156,7 +164,7 @@ struct dw_edma_core_ops {
 	u16 (*ch_count)(struct dw_edma *dw, enum dw_edma_dir dir);
 	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
 	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-				  dw_edma_handler_t done, dw_edma_handler_t abort);
+				  dw_edma_handler_t handler);
 	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
 	void (*ll_data)(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
 			u32 idx, bool cb, bool irq);
@@ -256,9 +264,9 @@ enum dma_status dw_edma_core_ch_status(struct dw_edma_chan *chan)
 
 static inline irqreturn_t
 dw_edma_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-			dw_edma_handler_t done, dw_edma_handler_t abort)
+			dw_edma_handler_t handler)
 {
-	return dw_irq->dw->core->handle_int(dw_irq, dir, done, abort);
+	return dw_irq->dw->core->handle_int(dw_irq, dir, handler);
 }
 
 static inline
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 9053354eda67..4a1bb128fa00 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -336,7 +336,7 @@ static void dw_edma_v0_core_clear_abort_int(struct dw_edma_chan *chan)
 
 static irqreturn_t
 dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-			   dw_edma_handler_t done, dw_edma_handler_t abort)
+			   dw_edma_handler_t handler)
 {
 	struct dw_edma *dw = dw_irq->dw;
 	unsigned long total, pos, val;
@@ -375,7 +375,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			continue;
 
 		dw_edma_v0_core_clear_done_int(chan);
-		done(chan);
+		handler(chan, DW_EDMA_IRQ_DONE);
 
 		ret = IRQ_HANDLED;
 	}
@@ -389,7 +389,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			continue;
 
 		dw_edma_v0_core_clear_abort_int(chan);
-		abort(chan);
+		handler(chan, DW_EDMA_IRQ_ABORT);
 
 		ret = IRQ_HANDLED;
 	}
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 4acbace43519..c6d7f9885aa8 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -174,7 +174,7 @@ static u32 dw_hdma_v0_core_status_int(struct dw_edma_chan *chan)
 
 static irqreturn_t
 dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-			   dw_edma_handler_t done, dw_edma_handler_t abort)
+			   dw_edma_handler_t handler)
 {
 	struct dw_edma *dw = dw_irq->dw;
 	unsigned long total, pos, val;
@@ -200,14 +200,14 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 		val = dw_hdma_v0_core_status_int(chan);
 		if (FIELD_GET(HDMA_V0_STOP_INT_MASK, val)) {
 			dw_hdma_v0_core_clear_done_int(chan);
-			done(chan);
+			handler(chan, DW_EDMA_IRQ_STOP);
 
 			ret = IRQ_HANDLED;
 		}
 
 		if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
 			dw_hdma_v0_core_clear_abort_int(chan);
-			abort(chan);
+			handler(chan, DW_EDMA_IRQ_ABORT);
 
 			ret = IRQ_HANDLED;
 		}
-- 
2.51.0

