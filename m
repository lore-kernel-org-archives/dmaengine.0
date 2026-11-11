Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366920;
	b=lMkXIu8kvCXUVoBggEvNNmGzrwd2Hyc9pGOXn5Q+ATEcDWxn9w7LrcWOGaz/ZmrlVJb9
	 lJGr9vhmpyPvlg/DBSI168/EGTTl+O9D5nBJe0TH6vX2p0Doi9gfTr1n2LrZz8iLAQetN
	 sykNSzURF4ajKQPDMy6Kl1xtyMC6qjMZXHr8WI8HJbXnT8S+LnnumfAQ7byoMNCgjewaN
	 1aN5u2iGbGNDdJopUhvYG0zo7B9qDqti1JZ7iozP7y1svwRp4U4UeptLp1dHUruuK/iGz
	 lTjm6PnQF/1z4cDmPmnZnypuyBCl6TosgvPB8DTuOMceH9BfcKKCABTzsClwYSYxNug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=l0vi1fNrlrZmz7yWWkSVUxeGDZ97UBQBJwEIiwWZ240=;
	b=vUijaWo1ZxbwljufqcBs8NpSiRzTtebuZ+JHioSui+lrzgCKuu9fvc07WWclri3WfmbK
	 dGpN0pu1Wx4LNWfW2vFk9n/xX7l212s1k+p4ge+tNa6PqhhMUS/FgZPAMYFQ63IADyHeZ
	 HdAJAFT/l8FqXPXlKlf3zEIJ9J0vKiopIMtanAJPpZGtBEamKdhEKd1e/biu74PJOsNM9
	 b4CQk5IixYGPXqL1l0s8BazyUW7nsFHPYgDeU5Z+GLK8eW/dygJYap3b8c8d68TjWEkvp
	 MzVdfcZwmq+gjNhyWBAFgnbc1rIqd3LCCBX+Vd4Zk5n/Gm+lwEd6bU3ovRMcDWLnajw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CmZtCQDX;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2CE606A32D
	for <dmaengine@vger.kernel.org>; Wed, 11 Nov 2026 03:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C2CE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CmZtCQDX
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4f488ba6e90so1002652b6e.3
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 19:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794366919; x=1794971719; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0vi1fNrlrZmz7yWWkSVUxeGDZ97UBQBJwEIiwWZ240=;
        b=CmZtCQDXkGsqoS/pnOdPykmsrEPZQfGaN5/EURbzXqNcLUwkPNpE2vX3tqlgkFrr91
         BFPEZ45ujN+xknq/WcbB+2JG2Xa06edZGeljUaOGN2j0g4W6yWyjTrWHmHNFMbaZ/cBV
         OIek6MgIRXBQEfP4fuW8GkihzxSvIWgua0zsWL5Z8BaywI4T0UM8vnUj6PJ5HdTuywuQ
         n/raSjacbgakZsSpfr617CrrBCwCyCswkkV9NcpgzBPtZcpI/3o2O5eMkUI0zVtKIgEa
         KM8ouVY3Q2oIivQdsxN8TAiieS64S38bt7P08MOHy3k82KgnQSTAvx9zRDwB4QuaOZKW
         /58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794366919; x=1794971719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0vi1fNrlrZmz7yWWkSVUxeGDZ97UBQBJwEIiwWZ240=;
        b=iMt75r1qntWMn9EQ2Xba5oxAs1sYVyZ4LFc29/cH0ds1061Uaf4LvvHrQlLSVFTG9Y
         PX27dinj8LsIgacadCYzSI7CqmlvDVfg/Rwu3IAJ1tAaOtt9udxXSimRqT6AXY+a/1zk
         BZNTugMbqC/hoBHFRmht7RnoH8OPbDfqYivshuSPJ4XM0WyuKQ1pGy3EMHe3B0QZIqpy
         4YKAeYTaJfjV5rgaKGQWaUeDatiVTJcUFkyqBaufzVbcCNKMTuTzZaG6cN711PzYsbUu
         HshPW4ls5iZY3y7RB5u79kBs13FTKHoHc+uWeXy4le+Is8n7iBQNbT/BPOFnYgJ6khwE
         aUlw==
X-Gm-Message-State: APuU4Z+q0N+mAMLJ9RMEwEBmzz+0+wMarDjsyytaJrIbdBRPWvPQ4zfi
	iHLTKSrLS/PvX8f+h/EWSuU2nazQnXAF6OJYzVN8YGHAIUr+JUfvO3VT
X-Gm-Gg: AYBFou2CKQlPAhmJyPTnyXcPJthsNAKDBFaExFg1GQ/NcrlVCqUBoljujaru/CM2a5+
	maqDA841+a1E69nHsxWxkMn96j/Xn1Q21Ovl+wq7PWoeCW1wgY45WaWP+kRK5nlZl0rH0z2XlVE
	U2F/SIgcNOt4gwc6KmIITOltt80eGU7XRMe8Et9SY0rNSlQh1FTaLc5pEj/zEkQRXu6ads6NuML
	2iT5kKHU7pYyTCHEjVUzSCHijkLxcBYrx2StWWXVVqkjYgk6vcvrb0zcWn/oYN+DDU+mspoj60p
	LiYsc+c5VyC9xxRIlEF5pmRBFoW8t9YJ4zapgD8b4oNgDJicsQK5QaLPjuCzXcZovQQ/RDyJOr+
	qLiNwmJSRTDPPrLjnXZGtUt6IxXi/vrbJqFFAiFXM6DCRr18ghxEq/VjYd7T3uI4CoPqaQoOFn1
	m0P3Dy0/ymbyIVs81KrDMSk8klld9dOm5dfuOBucx7lcZnruIXjxy3ms/IMJoZKnhUP53VUbgNR
	Y1Sh+wWA+fq91CJG1qVQQHdwz31bW4p0tC5BibFvrBkDha9a/NBRJLRbs9RtlS8gqPYZMZl2oc+
	NZX3iCA2bgw65C4GyIpot/Gy/sTPkvuZcfcscpsPiTzpdv4YAMWJJDHusGh4JZwkfp9iJm/g/eu
	Iozmg6FFc6C2wNSrGRbrCN+KF1ljcLpe7f9NY6iroduFo+wbw1tzYjRN8BbI3MYU0aWR99N60ov
	JdOl+bM26Rb6n8tyfucjX++ac1fEaF/BmkTmfFplzAYiXTIvgLfMs=
X-Received: by 2002:a05:6808:5198:b0:4f6:2ccb:c2a with SMTP id 5614622812f47-56b9861e983mr995316b6e.68.1794366919240;
        Tue, 10 Nov 2026 19:15:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm3999345b6e.3.2026.11.10.19.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:15:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 20:15:13 -0700
Subject: [PATCH v3 2/4] dmaengine: dw-axi-dmac: retain descriptors when
 termination times out
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-2-35fdfba8b61d@gmail.com>
References: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-0-35fdfba8b61d@gmail.com>
In-Reply-To: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-0-35fdfba8b61d@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

dma_chan_terminate_all() warns when the channel enable bit does not clear,
but then frees the descriptors and returns success. Its synchronize
callback only drains virtual-channel callbacks, so terminate_sync() can
also report success while hardware still accesses the transfer.

Return the polling error before detaching descriptors or changing the
peripheral routing. This keeps the transfer resources available while
the channel remains enabled and lets the caller retry termination without
treating the timeout as a successful stop.

Hold the channel lock across disabling, polling and descriptor detachment
so an interrupt handler cannot restart the channel between the stop check
and cleanup.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 2c2435c36ab7..a9a87589324d 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1187,22 +1187,25 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	int ret;
 	LIST_HEAD(head);
 
+	spin_lock_irqsave(&chan->vc.lock, flags);
+
 	axi_chan_disable(chan);
 
 	ret = readx_poll_timeout_atomic(axi_chan_is_hw_enable, chan,
 					enabled, !enabled,
 					1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC);
-	if (ret)
+	if (ret) {
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
+		return ret;
+	}
 
 	if (chan->direction != DMA_MEM_TO_MEM)
 		dw_axi_dma_set_hw_channel(chan, false);
 	if (chan->direction == DMA_MEM_TO_DEV)
 		dw_axi_dma_set_byte_halfword(chan, false);
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
-
 	vchan_get_all_descriptors(&chan->vc, &head);
 
 	chan->cyclic = false;

-- 
2.53.0

