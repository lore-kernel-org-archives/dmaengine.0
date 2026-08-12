Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020143.outbound.protection.outlook.com [52.101.229.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335CB43637C;
	Wed, 12 Aug 2026 15:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550273; cv=fail; b=m+Yfb7lkMgxsrS5hHLE0AZss+JgVuJ/jmKr3iCEX1bKcD/LqdTxI06Pn6QRAA9S+15a4qNaL1Y8M1ZBRqhLniibcIjNVAKERNhJ6iKWd3YyttFtdiaeouX+elqvCQDvZMEuxmaZKwIIy/9gygyZaelQF7Uz6aku1NM35cf4oP98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550273; c=relaxed/simple;
	bh=axRFgFoGwlwpC+c2dFY/BlQY/oP/sr41YkZVyCSg+1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cE+1JthMHCAhR/VaQJ2BteEsxMqf4eEB55Z8OND/MXLXYAjZZfr2szcRqrI25GLORa/iBTwfIaNMVqdMzDQKcdC7O+b16fm9extybOeFFPs/ktxxQZY+kE2JnUmQpsKy2sqJbDayBfBJffx/NJGmKq57sbwqKmFvCzwHRwh56uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=nvkbxPQE; arc=fail smtp.client-ip=52.101.229.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="nvkbxPQE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJDKyHiEXgEp1DiwIuj23S8gNwCx6Ov1HOZnMPM4Amxuuwi4XKUkh0W+7sNGAlJOPzlf3qERDVelJbQk4p2jqFKXTp58cvNul63wDHY9UTq24BafxE0IWwvNe5KCWo2stBqilGWhKI7YsuG9gXPxmBeGCVjucQKE3XZnXCveBubeJzQzrJr3bFBoPAcB/V9AJtUGgHM8cNH+WH6oFrXDkfSUtHxWueb2NJTwK/2JmZACxb2bLcKV9sn6MstormGM+yxBVj37kzDMUerPBDR36c41/1nHiWtmn4c8KpWRTulKh8j4a/oaRI8E290N2eoczMCnIDtj3ImtKn7nWn7TzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7pYf015fzZPSbV1eBPVsz5fjTdfQ6c5YiEDF1QgFWc=;
 b=v4NCCvzPCbLPHgfsGJcbdAdA+RYAvD89vIpMp9pV3s1gvHPLTOeRcaD3SieCALE6BeJmdW9GieDA65ozMDEHCiwBfMr8SUAiw7trthv92mHlQbCzSCsrlQILLWKi1JnXEjdcaUZAKYmCS1GY6Mo3AwlXXS+zPrejxh4+jalbOVPVkaQ+XjNo7rJe+58APvFgbsyrfvgUvNlpK76LKMwVQjxnVwBEMY3EfRM+iCzhNWgoz+GukCt4eHOiO10nONs1r6TIJzMxjnMGiu5VocliS+uyR8Y0/tuSHDjhcFCDTBHylJ5bQwxJGswwvdity9HJh3fcZ4mA+GH9ngfI/Sq8lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7pYf015fzZPSbV1eBPVsz5fjTdfQ6c5YiEDF1QgFWc=;
 b=nvkbxPQEAIP589GKdxlgJSnwTZv6Fj2tDIfGWm7i29NpBxCPu3zGlgt8OMzZwsBTfctYT7kl9fe2/iWeAg4y2NhDrpUt6AVUrGQUoEz/VN+ENaQSuteCniXmCBBxclA6/yF+c9RCCly3syknCUPYvuHJhb0HNGTmd3qKlS1AaeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB7069.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:343::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 15:57:41 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:41 +0000
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
Subject: [PATCH v5 19/24] dmaengine: dw-edma: Drain LL entries for STOP and PAUSE
Date: Thu, 13 Aug 2026 00:57:16 +0900
Message-ID: <20260812155721.2807506-20-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0330.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e927e61-daf1-4c72-85ed-08def88a708e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|23010399003|7416014|18002099003|22082099003|56012099006|6133799003|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	G4QiZWldPSW22ZjFP6OQwJfEj0/Dp8azkQigK60c8LK6DV99w+AqzSdWpFMqQaw3Y7PtVpT1CYakkYcjQVZV5uu5nsUy15zYQKGwKAAbvfdF9iGvGswa5fDRGW2jNftGk17egxo3OjTHvzqlP6LujsCUlvbWT5E01k43exBYdoyFy9DHSfqwhXinU7ae1FcaZDd7Sy+0BK62tfy6s7mDd1ZrmqWmYRskvPnHR6xqn9HvXzmAcVAitE7e0nbroR3WmbK6XyxoOpz+d18Uj2e+nIcjIwMTqP4TJsJTpliHLYOBnibJZkrsya4i3puvCHxvKT4i4llc8E2DZNMafa5PNiB0NfkgHfzytRjhbEtavisG8syTk7HKKFHTUKpvJEIbrvuZInJsfv8AN/fsG/tT6Sp2MAzL9laJKk0UD+2rDDTJZSDcpCgZEQpkYcVrw+IXPmnvYj1rECL0oVfvW53u/Goivgt0XeUptWKtXKw3kAaJaNhsF65q7pALfnsoWmX+BQGjBecnYOd+qPVSu7NgWJldMnCppgsgWH3JY7SPxnVRN9411L/qkrpzAk90YJNi8Zl8aZ9/hEZ71akpYG7gPjfI+MSXQgnTntxqTpbMB1o0JzPw1Kmwaio6gPtQ/KwQ2YWeBhONnirtXFZ+RvQmNbRxUwrQ/ODvHqz7vVHNGyA4/RMLB95FZZg/SG3p0LEX+2Ovx1pSOrb63GmGWe+5Zg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(23010399003)(7416014)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I8HGif8bA7AVI/06/dHMbfjfiAG+65M1emgR9g4B23fiKDbPOxOWWtZo/ADC?=
 =?us-ascii?Q?RszXM3a4dy8iCYRgxO14RNbVz/AvvsJE6AzUjMCdNCtZi6aKp5ts+m3/Xn8m?=
 =?us-ascii?Q?dmJDuxqfqqsP3lEnbGNfUqRgx46H1aj7178NRs79FhMijPJTPpr9ZZnSoE/V?=
 =?us-ascii?Q?Wr5OAHUbU2aFgfq/5gjjCcNU/VhHo8ouPGd2plF4vLg8pCJp8I6mm8PGmcsD?=
 =?us-ascii?Q?UIB0psnLl4KpqAsMrx5qaQNNY0j6SKXCCNUWeq4StMYFAMYNwVWt7zjDkknP?=
 =?us-ascii?Q?4Kr61vb1xemikCkyBis2tfhJjotjkgxFzCx0VBnxUcNcJforcLZqS87pdvTS?=
 =?us-ascii?Q?2lWWCPMmTAmUZPf8xjoZ8w1/l7QGHaCGIkCXLleDi8yQDNJwdqpTfb52/izm?=
 =?us-ascii?Q?7SJ8kVrE7J2oFewal/uxP8DnFwhLGh8ODQyfnkOJr8V1+kZ8uSRv5XH4CwcF?=
 =?us-ascii?Q?mDtlIt7+Zgsa/m9ZrmaIM+2QN5KXMwXzfneILeR+Zmi2zdjWtLbRPwFCp8v4?=
 =?us-ascii?Q?tsT0khDc5LStc/IBLQURBi/b2rWMdXMkPpfhDGS7Xq6fXhFu0g/iAldNgwkE?=
 =?us-ascii?Q?OVyM8azV59qWYcGTy4XFHeNTqsgqlDr5S66z9k9ZNVYSkRleIoPCu8m8jSCL?=
 =?us-ascii?Q?e3u7uzzAGnknapZzi/wVY9FzXhOoU6Dr01dk1ouMWW2ZDTE1c5mevrP6K74f?=
 =?us-ascii?Q?IsUBCCANjxKCg+XXBi0yRdY6EQtSp/aFPnk9PEuzc4tsRrs+AnJRSlt1IPVG?=
 =?us-ascii?Q?0vxHLtHhg4zIqeTdcaVlHPQZcx5/K0nvuAvT7u2EYd1wO50O48VZYkD9xvvF?=
 =?us-ascii?Q?TyA2BNvnwlWGQ4qCEoZojHY1wcq/0I3EYCOcQlWmhuen1pnsIWW15jlMr1ZA?=
 =?us-ascii?Q?FFuPRaOC85x2WLgFPHORINZrkgd8zkAYN/3hxPSe4WXCYYWwO1rFiICCOLdw?=
 =?us-ascii?Q?x3R5RPkKp8fs5JSIC8zkH3HbA2qrzql8Ghj+hDQgq/QdtuEr1bWka8qSs6ud?=
 =?us-ascii?Q?3OqmH+iIs4V1SpSeJ7C+IUCuldLU8cEHTjUqkAqRtt4X69iJ5q2eHV3vPySQ?=
 =?us-ascii?Q?vt4oW+5ig+cw42VkqfkC6zPc+Kr6KkYFFkGOOOMlOwPVls1FAKyl5lBL5zEv?=
 =?us-ascii?Q?IYn2j+vB6BYAnyfypmyD6ELw+BP5acjim+aFNowEbdQSsvAMfZQ/tNtOnF4K?=
 =?us-ascii?Q?RevkFnHCcMVfRMcF3UxkHd+uNiqfgJ5FVdhBwdXOFhzUYuzSnxfDHEoMis0A?=
 =?us-ascii?Q?B9+jIS3JY1UCUViFpM8qaJnk7fBrXl/bPD1Pige68nEjzrAZ2MGL1RBIS01l?=
 =?us-ascii?Q?g5wQO/mIvHI4m3X8nRJL3AAqQWqD093XLj/SC7rgPIgQz8p+FMeommqVhvmi?=
 =?us-ascii?Q?bW3pI5A3kng4EgJtya7HJt0BAsi/wNpuOKyrkuT741ouX8rPkW509aeUGaKL?=
 =?us-ascii?Q?V9R38ifP/F+lc4zIeuKJrge02aqDB41dPM5d7Eab1eXBYdAq8qE8/q6JGshY?=
 =?us-ascii?Q?+v+t5E+thxvxap3foBEamASwwkgG/EDYOrxuT/tcvXrwNx+rHGbhEEJ9JA6c?=
 =?us-ascii?Q?PlqzuD3ApSuxRjdnOnE4T7FDBLirmlaDb9uo7v1UYuZucyCOn+nZ0EL2EA2Z?=
 =?us-ascii?Q?3KpG7peq6vPDc9KPwnhy70+68xoaWLcrevq5xdPvhjXgjIU71agMvaKUbn69?=
 =?us-ascii?Q?P6dCOP9CaaYM2A1Ce9D+mnV6uG8tst0wPC1F9kHkM8Keg5xqrBVACzSKjMsj?=
 =?us-ascii?Q?fkquQij3/r/i95WY6j83A/64IOIItNqxm7NMSKBRME/Sl0frwulh?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e927e61-daf1-4c72-85ed-08def88a708e
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:41.1244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMv/IMsl7MGcj7BSJg2nTEtqjpLAdQSsQonsu+Ciz37CEDWkzcFZAT39EnZoGbUVDeJNt0jQp7lXJxmC1CPOLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7069

An EDMA_REQ_STOP or EDMA_REQ_PAUSE can arrive while hardware still owns
published LL entries. Keep the request pending until hardware consumes
them instead of discarding the ring state immediately.

With the eDMA-compatible interrupt interface, a DONE interrupt can
report progress rather than a stop, and STOPPED status may still be
visible while a doorbell-triggered start takes effect. Before kicking
the remaining entries, serialize the stopped-state and
zero-transfer-size checks, the DMA_LLP sample and the interrupt-status
clear against IRQ capture. Consume that boundary without refilling so
the producer boundary stays fixed and the kick path cannot clear its
DONE status before accounting for the stop.

If the channel has already stopped when the request arrives, complete
the request once the stopped boundary consumes all published entries.
Otherwise, kick only the entries published before the request. If status
still reports the channel running, arm one delayed recheck to catch a
later stop at a CB mismatch. Native HDMA reports STOP separately; non-LL
completion and EDMA_ST_PAUSE also identify a stopped channel.

If an ABORT is pending, leave cleanup to its handler and do not ring
another doorbell. Once EDMA_REQ_STOP completes, terminate submitted and
issued descriptors without callbacks. EDMA_REQ_PAUSE leaves the channel
stopped for resume.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - Explain why termination keeps waiting after reporting a timeout.
    (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c | 116 +++++++++++++++++++++--------
 1 file changed, 86 insertions(+), 30 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index eb0fc73a4f47..1cc9fa4866b9 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -459,6 +459,13 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
 	chan->status = EDMA_ST_IDLE;
 }
 
+/* Must be called with vc.lock held after the channel has stopped. */
+static void dw_edma_finish_pause(struct dw_edma_chan *chan)
+{
+	dw_edma_set_request(chan, EDMA_REQ_NONE);
+	chan->status = EDMA_ST_PAUSE;
+}
+
 /*
  * Must be called with vc.lock held. Consume an LL progress boundary,
  * advance ll_done and complete descriptors covered by the consumed range.
@@ -692,8 +699,9 @@ static void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
  */
 static bool dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 {
-	if (chan->non_ll || chan->request != EDMA_REQ_NONE ||
-	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan) ||
+	if (chan->non_ll ||
+	    chan->status != EDMA_ST_BUSY ||
+	    !dw_edma_ll_pending(chan) ||
 	    dw_edma_abort_is_pending(chan))
 		return false;
 
@@ -704,9 +712,25 @@ static bool dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 	if (dw_edma_core_ch_status(chan) == DMA_IN_PROGRESS)
 		return true;
 
-	dw_edma_ll_reconcile_and_refill(chan);
-	if (!dw_edma_ll_pending(chan))
-		return false;
+	/*
+	 * Normal work may refill a stopped tail. STOP and PAUSE freeze the
+	 * producer boundary, so only kick entries published before the request.
+	 */
+	if (chan->request == EDMA_REQ_NONE) {
+		dw_edma_ll_reconcile_and_refill(chan);
+		if (!dw_edma_ll_pending(chan))
+			return false;
+	} else {
+		dw_edma_ll_reconcile_stopped(chan);
+		if (!dw_edma_ll_pending(chan)) {
+			if (chan->request == EDMA_REQ_STOP)
+				dw_edma_finish_termination(chan);
+			else
+				dw_edma_finish_pause(chan);
+
+			return false;
+		}
+	}
 
 	dw_edma_core_ch_doorbell(chan);
 	if (!dw_edma_ll_has_hdma_stop_event(chan))
@@ -752,8 +776,7 @@ static void dw_edma_ll_recheck_work(struct work_struct *work)
 	}
 
 	chan->ll_recheck_at = 0;
-	if (chan->request == EDMA_REQ_NONE)
-		dw_edma_core_ch_maybe_doorbell(chan);
+	dw_edma_core_ch_maybe_doorbell(chan);
 }
 
 static void dw_edma_device_caps(struct dma_chan *dchan,
@@ -845,6 +868,16 @@ dw_edma_device_get_config(struct dma_chan *dchan,
 	return &chan->config;
 }
 
+/* Must be called with vc.lock held. */
+static void dw_edma_request_pause(struct dw_edma_chan *chan)
+{
+	dw_edma_set_request(chan, EDMA_REQ_PAUSE);
+	if (!chan->non_ll && !dw_edma_ll_pending(chan))
+		dw_edma_finish_pause(chan);
+	else
+		dw_edma_core_ch_maybe_doorbell_or_recheck(chan);
+}
+
 static int dw_edma_device_pause(struct dma_chan *dchan)
 {
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
@@ -859,7 +892,7 @@ static int dw_edma_device_pause(struct dma_chan *dchan)
 	else if (chan->request != EDMA_REQ_NONE)
 		err = -EPERM;
 	else
-		dw_edma_set_request(chan, EDMA_REQ_PAUSE);
+		dw_edma_request_pause(chan);
 
 	return err;
 }
@@ -887,35 +920,52 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
 	return err;
 }
 
+/* Must be called with vc.lock held. */
+static bool dw_edma_may_be_active(struct dw_edma_chan *chan)
+{
+	if (chan->non_ll)
+		return dw_edma_core_ch_status(chan) == DMA_IN_PROGRESS;
+
+	if (!dw_edma_ll_pending(chan))
+		return false;
+
+	/*
+	 * eDMA can report STOPPED while a doorbell-triggered start is
+	 * still pending. Native HDMA has a dedicated STOP event.
+	 */
+	return !dw_edma_ll_has_hdma_stop_event(chan) ||
+	       dw_edma_core_ch_status(chan) == DMA_IN_PROGRESS;
+}
+
 static int dw_edma_device_terminate_all(struct dma_chan *dchan)
 {
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
-	int err = 0;
 
 	guard(spinlock_irqsave)(&chan->vc.lock);
 
 	if (!chan->configured) {
 		dw_edma_terminate_all_descs(chan);
+		chan->request = EDMA_REQ_NONE;
 	} else if (chan->status == EDMA_ST_PAUSE) {
+		/* A paused channel has already stopped. */
 		dw_edma_finish_termination(chan);
-	} else if (chan->status == EDMA_ST_IDLE) {
-		dw_edma_finish_termination(chan);
-	} else if (dw_edma_core_ch_status(chan) == DMA_COMPLETE) {
+	} else if (dw_edma_may_be_active(chan)) {
 		/*
-		 * The channel is in a false BUSY state, probably didn't
-		 * receive or lost an interrupt
+		 * Keep published entries intact until an IRQ sample confirms
+		 * that the channel stopped. An outstanding EDMA_REQ_PAUSE is
+		 * replaced by EDMA_REQ_STOP.
 		 */
-		dw_edma_finish_termination(chan);
-	} else if (chan->request > EDMA_REQ_PAUSE) {
-		err = -EPERM;
-	} else {
 		dw_edma_set_request(chan, EDMA_REQ_STOP);
+		dw_edma_core_ch_maybe_doorbell_or_recheck(chan);
+	} else {
+		/*
+		 * No LL entry is hardware-owned, or non-LL status confirms that
+		 * the one programmed burst is not running.
+		 */
+		dw_edma_finish_termination(chan);
 	}
-	if (chan->status == EDMA_ST_IDLE &&
-	    !dw_edma_abort_is_pending(chan))
-		dw_edma_set_request(chan, EDMA_REQ_NONE);
 
-	return err;
+	return 0;
 }
 
 static void dw_edma_device_issue_pending(struct dma_chan *dchan)
@@ -1256,8 +1306,7 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 		}
 
 		if (chan->request == EDMA_REQ_PAUSE) {
-			dw_edma_set_request(chan, EDMA_REQ_NONE);
-			chan->status = EDMA_ST_PAUSE;
+			dw_edma_finish_pause(chan);
 			break;
 		}
 
@@ -1300,8 +1349,7 @@ static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
 		break;
 
 	case EDMA_REQ_PAUSE:
-		dw_edma_set_request(chan, EDMA_REQ_NONE);
-		chan->status = EDMA_ST_PAUSE;
+		dw_edma_finish_pause(chan);
 		break;
 
 	case EDMA_REQ_STOP:
@@ -1598,19 +1646,27 @@ static void dw_edma_wait_termination(struct dma_chan *dchan)
 	/*
 	 * A STOP may be deferred to a later interrupt while the channel is still
 	 * running. Wait until that handler completes the termination.
+	 *
+	 * dmaengine_synchronize() cannot report an error. Returning while
+	 * EDMA_REQ_STOP remains pending would let callers release transfer
+	 * resources even though hardware access cannot be ruled out. Warn
+	 * periodically, but keep waiting.
 	 */
-	while (time_before(jiffies, timeout)) {
+	for (;;) {
 		scoped_guard(spinlock_irqsave, &chan->vc.lock)
 			stopping = chan->request == EDMA_REQ_STOP;
 
 		if (!stopping)
 			return;
 
+		if (time_after_eq(jiffies, timeout)) {
+			dev_warn(chan->dw->chip->dev,
+				 "timeout waiting for channel termination; still waiting\n");
+			timeout = jiffies + msecs_to_jiffies(5000);
+		}
+
 		fsleep(1000);
 	}
-
-	dev_warn(chan->dw->chip->dev,
-		 "timeout waiting for channel termination\n");
 }
 
 static void dw_edma_device_synchronize(struct dma_chan *dchan)
-- 
2.51.0

