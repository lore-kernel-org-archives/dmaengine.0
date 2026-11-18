Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996548;
	b=nnLAKNT2Dt/+oWJUzu2WipkJ6t8rs6QK0+5BO0CflBgOa7O3Fx76NhANjIulS89e3oOt
	 4074tQ6dbYRvhZYJOJWseSYPhwU6nCSCDhNX/i32PlciFM+MqY2c96IWJwB7flGc2nMbT
	 Zlq64Q/xZooNzvE9TkQaxA07jv4w3M6CSV7aRihdc7Jzh4+APohkrJU+Vqz800uqcmzuQ
	 K7QMn9te/z2QtyJq0evLJZA5KVtsI+S2UevwELtTcDqwjs9DYRxG4f4qkOr1DjhtEJnhM
	 2kFsKi5E4+DQNjaT817Nd2gAnX95PeozE/Oz5xHVl15GxrL7Apz6EezTrARe1eg/LQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=+B1TOH9oUaUU/yKHKlpMG2Fg0rcqqVsIpnka2NiH2/I=;
	b=JWs/wBS3OTXO1vu08+VVNv9JZ+O1NHOtmY4tZLFpwmOOH4uv6+A3fog1eUUVTTX3kGkl
	 sg6jZoJj05wlIfDksHxMOV8qQXTtXotIeeyf2S8LwPlUMo0Z8lLmuD4GI4XMh0ZYtYyNI
	 WJPEUhc1sbBORMtvw97TMRscxIU2/om0xtzEPuVYOk7Rp9sfPyHze2qMfpamo5p46WR6d
	 hlKSpUfhyCjcw4ufhoqcKiAZW3metk4E8WmGSA3lv3fr9f9r1su9/E2vGEkRd+UKSYoR5
	 AVJATBH8td0i2Satxrvmx40wTseVJHp7bT2MKuf5ZsbQwFrkumTh6N8lHndMqi5cIgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--amitamishra.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G14vOFv3;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A33606A325
	for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 10:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15A33606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitamishra.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G14vOFv3
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8aa185840bdso745502b3a.3
        for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 02:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794996547; x=1795601347; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+B1TOH9oUaUU/yKHKlpMG2Fg0rcqqVsIpnka2NiH2/I=;
        b=G14vOFv3Ujb4z9LNJX6zHgOB/CiwYIy9Oy8Jt5I6Gz3ApMFDg7KvkQ6RdNztHu3C8c
         qziMNmi2uJwjjaGR1vEA01vJ0dWRcsexxdNVY3WbxuuoGZ00IDI5nfaFpfm2TOVvOmEv
         v6GBlsjWXLTtTTxV/GBDpFeJg3Lnac74OjZ1x9PjbqKwQWKRLSbDHwJkWH1Xbwre/Oyq
         daIGMoFrDrnzXyHsjznsigqT+tDVSneoU1pbr0wCyfdQRCZrV/uqPnvH3EesfIHdEkK/
         q1rQAwwD0IsLN3y5YmG2rO3PFMh07S/0ZSqHrTRr1v6g7FbtivSzK02Bzn0XmTaGF8je
         T/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996547; x=1795601347;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+B1TOH9oUaUU/yKHKlpMG2Fg0rcqqVsIpnka2NiH2/I=;
        b=qYqNCRr7JAYLeF2mdycNyHZEDb7ZlOzxc5u9yZ3YCtKc2zT19sA1yMLwf7ddUZczyT
         iMrzKjQOvFDIFMSPQmFgapbxHGqnUM7eqw4nxROdQilAEYWWwcKuP/PRs94NHX7dK2j4
         kE03S7lSsfN4+re9ptiblsrO8J1A6CvLw/GMv1KoHxzp5K0GFXVhuMZlMuML1EUVBlXl
         jOho3Jq9s+o7i/ZC51F2pKwbj+vGmu5qGWWdomBqEdbqUYHQNYIF9aT6AU4jU8yo/6JQ
         86cUWyoqKP5ZrocVO1/0P4lk/+nVK60OrfCR7tk1XktlEp5R++V6Kbl+M6Oxm8hCQK6A
         ucuA==
X-Forwarded-Encrypted: i=1; AL+hErEi23JNkgewM0aaKfR2bfAIzR0KoUZgpIxuECtkaHIxbi89me03LbHKuxPKlAsycl85Alxe5tJkIA4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mCEzb5I/YucWADWg+sqy/zYQTO4HX1SAk2xZnSN8iL+ave+zG
	aX1xUWzBP0sENUsHvmoB9UW4tVfB/EO/egI3+uvXzsLEXhLG4CbfwYwa81jtemdLwn+R4g2lkvS
	tdGJuvJrWypQS8AaUrPv1qKeljw==
X-Received: from pfdf8.prod.google.com ([2002:aa7:8b08:0:b0:8c5:fdd3:6020])
 (user=amitamishra job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1c8e:b0:87d:ee98:606 with SMTP id d2e1a72fcca58-8c5d45de9a8mr1864339b3a.23.1794996547074;
 Wed, 18 Nov 2026 02:09:07 -0800 (PST)
Date: Wed, 18 Nov 2026 10:08:39 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118100839.3090172-1-amitamishra@google.com>
Subject: [PATCH] dmaengine: dmatest: terminate channel on timeout or error
From: Amita Mishra <amitamishra@google.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, Dan Williams <djbw@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Amita Mishra <amitamishra@google.com>
Content-Type: text/plain; charset="UTF-8"

In interrupt mode (!params->polled), when wait_event_freezable_timeout()
times out (!done->done) or dma_async_is_tx_complete() reports a
non-DMA_COMPLETE status, dmatest_func() jumps to error_unmap_continue and
calls dmaengine_unmap_put() without terminating the DMA channel first.
Channel termination via dmaengine_terminate_sync() only happens later
when the test thread exits, unlike the polled path which terminates the
channel immediately after dma_sync_wait().

If the DMA controller is still actively transferring when the source and
destination buffers are unmapped, an IOMMU-backed DMA engine will trigger
use-after-unmap translation faults, or overwrite the buffers while the
next iteration reinitializes them. In addition, if the timed-out transfer
completes during a subsequent iteration, its callback sets the shared
per-thread done flag and wakes done_wait prematurely, causing the next
iteration to fail with "completion busy status".

Terminate the channel with dmaengine_terminate_sync() on both the timeout
and non-DMA_COMPLETE error paths before unmapping the buffers, skipping
the redundant call on timeout when params->polled has already terminated
the channel.

Fixes: 4076e755dbec ("dmatest: convert to dmaengine_unmap_data")
Cc: stable@vger.kernel.org
Signed-off-by: Amita Mishra <amitamishra@google.com>
---
 drivers/dma/dmatest.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index 2ae3469397f3..950b7a9e7769 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -852,6 +852,8 @@ static int dmatest_func(void *data)
 		}
 
 		if (!done->done) {
+			if (!params->polled)
+				dmaengine_terminate_sync(chan);
 			result("test timed out", total_tests, src->off, dst->off,
 			       len, 0);
 			goto error_unmap_continue;
@@ -859,6 +861,7 @@ static int dmatest_func(void *data)
 			   !(dma_has_cap(DMA_COMPLETION_NO_ORDER,
 					 dev->cap_mask) &&
 			     status == DMA_OUT_OF_ORDER)) {
+			dmaengine_terminate_sync(chan);
 			result(status == DMA_ERROR ?
 			       "completion error status" :
 			       "completion busy status", total_tests, src->off,

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1.703.gf848ed807c-goog

