Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695176;
	b=EHdabtStQqi47+EW3KVQzF2la2ueDNcA55G8Jgv9D+cJp6Wpbc9XNBVQv5HkJcpOiTPg
	 KlROAF6ADmMWombb4DCYXWJLSTyfWH15TIxEgouvwmgmiy7EqXtZpuZEvvyIbnenjSFn6
	 FxIGIa7mVy63c/hn4BOYAUWDnjHta2K+odEvIc7X5HI/O6PfqnF07PmYm1jDs/0WKd6Vv
	 /hVAMDCQYfJg+QxpCZniOMCKRftKPra51ltxQki9ajrVgDAlFODyshrQNyE0uKFKV8V2E
	 dk/LxGQqjUVqpyjxY5Ow2qzHjeMRkpVa/Xj+4FKpH9GB4GhxOyk8xkZjI+c4fc017kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=iUu/R+fBQNIMW0hUqQNheGWUYLG4zuBOi30rdtyLED0=;
	b=ZgyoJwuv3iLoWTXPvpFmoaxPVhDY6h0UB4QDnkP9LznB6nY/0prXSvVsz6+SejQkV9vZ
	 lFvfvZcTp+2vTMbEqpQgpnkZyFLne5wSMjaRso7i3FUxzJofISeQORXFIoIrHfDMmxfC4
	 2fEaKvslrgTwHzbD+xt83Kx18yEpouPPP+Z9S02h8bONJdbjUEChN+8qwcEC8iewH8ep4
	 Ho2wu3gSmOeizJdGuFAQTK1rAwqeLrUIzhWWJ91iK2RxsEAaxe/x20CZayrr+3Y9NCFc0
	 r4LkIwNDm6qXZH8vMyWM/NtO/hshSbkCHOEUZ4zehHvmhUGRMWRRA5IBFaGQP/hbDSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P9v8HJvl;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493B160A2621
	for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 18:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 493B160A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P9v8HJvl
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-70059e4dab6so78400eaf.3
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 11:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695174; x=1793299974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iUu/R+fBQNIMW0hUqQNheGWUYLG4zuBOi30rdtyLED0=;
        b=P9v8HJvlMMQn/I0jrZo9LW4QekCfzsbPcKDzCG5Gzku+A4Z0mQP+5wl2UdUnmSaSEz
         oK0TZgnRqOE8h3/SQL1R8vbvgzqU9bmZ+lOJZyK+r33IJIhVFSgH7qCeXIAeHRcDCUy0
         rgqVYwjMOPf3bx2XCmkFsvAPjdeGhsRk904q/4wv2Wcjle5tBOda1jvYlimhAf6kwY6h
         amrrKPs5g3BsZiFR0qA7NcQ0ERBn2L0gLhHk3TTTR1XdJVhA9kRprO7gmGbsnSAEkYc8
         8wzHiU0Ura/HV1Ipn4TO27c0qvzjUSb4v4PLPmtoKHftkogeL718sDeBg7PxYHDIwvyg
         baww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695174; x=1793299974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iUu/R+fBQNIMW0hUqQNheGWUYLG4zuBOi30rdtyLED0=;
        b=Wh9oPZYG++XNDRY0Rdqc0NVpiUuBsNt1cGtykyqJGNZkJpw623OcikZTmz9bBf1BLG
         FziL4Y08yKP8FGMhlBP/CFQba1DIHXiE1j6waZdemPnJW83su58A0vqAAdltsw+45MPU
         iPTF29RCTy+MMBIogHtvXCgvQLqvx2T2tPmxFh8dV0Y/AL/3O5XaA/ztAwph7s174UEV
         xE0mfxkcBVD1tEOzuLRS4kYQSALsYcmBFVb9u2D/IyplhT1vEuT0hL8EB98s+PXeV5m2
         NPYfnV+ZFSOKABacLaPXJFxA+JqYectK4XhmQi7dJk1iuuR/CLFaZlJAsJvSWeZ8fNad
         OHmg==
X-Forwarded-Encrypted: i=1; AKwUvByRZljIlT/RIm4sYT/RAa1daevn0aytSDDQPSChKQ6/S2TV30LIYADAZGZClF+mOeTGKLw728WiayI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxewZzjtHR/sJVs8x7ziDK4zMCfMkwvZy/sHQRkoG7l88sYRJi
	Jh7vRIxvKH/pHJLf8NvRYPqE8ROz7V1VqMEjmlIL3u9Lot8WvEUpDfGE
X-Gm-Gg: AYBFou1/VDD3ecpe1LtLyeiooRWYMUGy624FkGbirn9GGWHkY4oX3mr1zpmK1oerr9U
	TPh7ShenN5V2/4BicrAGMpShwFJFkuh7ivWOJhT1CPZ0K9czfbdMs1osybpMNw2QWGZb+I7Vli1
	2NUiQmg1xdx0AbjGpt+utAkVyqoO2kaUkcNN3ZYQMZZXH1F6Yb/Q0ibb8Kwu3qQJU30LsUaH2Pg
	KEJ4Jqw8avLu9bxdxcp6XAkroO7Gw5iR6xylE+w7N3sxcGbIVQEuIWUnifbbxIMpwMVTsNHzba1
	IWF64SwpZXlvoph4xGw4D0PX9gLAyS039EAHeofsesUw6RxWDBEyYjrF1G8JsildGV9MQHNM1TD
	HUUXlKPYIeIzXr74/pS8gCoqEy4BxfI8KM3MN/GefYR03HK4I5EVcZVymtidDndMspQq3VT8r5z
	S+OU+MUrl+Zq7yNC1/kjQypEO79Gv7SLe9zlADFjXX3SAtKAUijXDjvpiINI7wWMPEfeIhdeFEs
	QpNph0Ftdu8QeitLGTc9tIOX25bZZYksJ6z2VAvwQDqi18Yc67jrY9WOqwY45JHHa1C2B8qvEer
	oQ0eMET+NkFuszE9cqBu6BtNa0FAo729CMF16/k3waftJocOAfNo3RHE/rKmiWo86fOSQHKKYRn
	K9IOlCxiBelNlsMEy3i89B51LK3Ud3izbZWjz6NwEenbwiDVX+YijQjl7ZtRwBeDK0tnZDO5ojS
	SNyV0=
X-Received: by 2002:a05:6820:5601:b0:704:4ad:9c5e with SMTP id 006d021491bc7-70b88a1cf2dmr160306eaf.26.1792695174166;
        Thu, 22 Oct 2026 11:52:54 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84f7703d288sm536083a34.4.2026.10.22.11.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:52:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 12:52:51 -0600
Subject: [PATCH v2 4/4] dmaengine: dw: synchronize completion callbacks
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
Message-Id: <20261022-submit-dw-dma-synchronize-v1-v2-4-5244e94dca8c@gmail.com>
References: <20261022-submit-dw-dma-synchronize-v1-v2-0-5244e94dca8c@gmail.com>
In-Reply-To: <20261022-submit-dw-dma-synchronize-v1-v2-0-5244e94dca8c@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

The controller tasklet can remove a descriptor from active_list and
invoke its callback outside the channel lock. Terminating the channel
does not wait for that callback, and there is no device_synchronize
hook. A client can therefore reuse callback state or release its buffers
after dmaengine_synchronize() while an old callback still uses them.

Disable and re-enable the controller tasklet from device_synchronize,
outside the channel lock. Disabling waits for an executing tasklet,
including descriptors it already removed from the channel lists. After
termination, a later tasklet run cannot acquire another descriptor from
the terminated channel. Clients must continue to exclude new submissions
on that channel until synchronization finishes.

The tasklet is shared, so other channels may schedule it while this wait
is in progress. Preserve those pending runs: tasklet_kill() temporarily
owns the scheduling bit and can consume a concurrent scheduling request,
leaving controller interrupts masked. The disable/enable pair leaves the
scheduling bit and pending tasklet queue intact. Other channels' hardware
transfers continue, though their callbacks may be briefly deferred.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-180707@kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 1df028970c4a..9e5e526f7672 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -942,6 +942,19 @@ static int dwc_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
+static void dwc_synchronize(struct dma_chan *chan)
+{
+	struct dw_dma *dw = to_dw_dma(chan->device);
+
+	/*
+	 * Termination removes the channel's descriptors from the lists, but a
+	 * running tasklet may still own a completed descriptor and its callback.
+	 * Wait for that run without losing schedules from the other channels.
+	 */
+	tasklet_disable(&dw->tasklet);
+	tasklet_enable(&dw->tasklet);
+}
+
 static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 {
 	struct dw_desc *desc;
@@ -1333,6 +1346,7 @@ int do_dma_probe(struct dw_dma_chip *chip)
 	dw->dma.device_pause = dwc_pause;
 	dw->dma.device_resume = dwc_resume;
 	dw->dma.device_terminate_all = dwc_terminate_all;
+	dw->dma.device_synchronize = dwc_synchronize;
 
 	dw->dma.device_tx_status = dwc_tx_status;
 	dw->dma.device_issue_pending = dwc_issue_pending;

-- 
2.53.0

