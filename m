Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792712944;
	b=4Sl5Tp+EzIAplLd1kTNkk8smvCdZuqZBIj3qvqr5H6KK/b1OogOAt3WRnt9fngevXCYD
	 dnVkY5u/AhoZMQYdF8M1lCFiAg65UEv37hXZmkDjtSf1PE2YpEWGPmrK66gk+r50HP6Z1
	 gTUsYxXuai107GlBoYRhPS2gcmrhnIj0omodOxG/DOH7w2rxrD5EkGSeLiJ3+NMGOQEYo
	 ovv12OOqS8+7FKD1sx27dUQ0Qv6eEdUJwkvNtz6r96FWwuA7Y/BzBs3449n/5jy50Grux
	 CE9czieMHoYi05q02MMrTXWhWEIRQPEpRcbCk8GmYujOUWZpOPBXIlSe+pCbouWPIiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792712944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=hG4DQLwgfQ2Ox8LPZjYJVttUVZFQq7dsn2e6G1CsU64=;
	b=bXIX+WIx5jVQSCJ2onmOrAnxJxXV+AmbroQ9gaY7eUCHuNnSYvmikqLXI/lryhvzNiFX
	 Tm/yh1TYXXTcPc1W+hJHDivJBckko4twpCFpsoIZx7NO9Ka8kT3KQQG1Eityi8Lv/8aHc
	 FBNAEL/CgDeNyD9mXWl8kFLkGhnywKtRTW/DktHgQVqNQtzmmMl/aFcnMFNnQs3I4GybS
	 OqCEWYWH09HFkqYEzxjXQ3uBVkm+Fg8dcQoIM/ZcZuyFxrN2sEq4amYIeVuZwhXD1XUs0
	 xvne7I528hgeiHqHD4Yc/UOSUNwc/kgeIW8W8uuAG7iYlXHL7wF/Cq09ARyCtdYOj7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nullptr.com;
	spf=pass smtp.mailfrom=nullptr.com;
	dkim=pass header.d=nullptr.com header.i=@nullptr.com header.a=rsa-sha256 header.s=google header.b=DUsWdXiN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCEE606A31B
	for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 23:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CCEE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nullptr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nullptr.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nullptr.com header.i=@nullptr.com header.a=rsa-sha256 header.s=google header.b=DUsWdXiN
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so958101eec.1
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 16:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792712942; cv=none;
        d=google.com; s=arc-20260327;
        b=LZWrTYwgDHIMFWi1lycvum0uK2CCXPpON4Y3qb23DQ3n0c7sa3c2L4FQZkHJhvXUxI
         kSvaUtiDVfdGI9DoNiam4K4YmvA5kGxTsEdA1Ps3YNudlcGFbWqk3iIBucN2UZ8nUoHu
         7iZ9POUrWo8PMbsb81ZQRAVBgnDztY5MozGDin/VxpsFQGP310ag77VSLrX9hB4Q5afL
         GdlnEojHnZy4m6YiK4fnRdDG/mKVPX6eWtsimgdcgMbeREj86XT6OmOlD8ZO8GfaU33H
         OE57IeCF/Uw02VfFxJtbsdW6k/tE+HXzjkGgq1jLLHiWhrp09UFgyIRwaAJYp2h21i4+
         HC9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hG4DQLwgfQ2Ox8LPZjYJVttUVZFQq7dsn2e6G1CsU64=;
        fh=LrM3G6RcmBZ425pLRY8E44TM1XcCb9gU9D3viVl1X8E=;
        b=moB2aHZHGyMmYd7lTD7/geq07chKsF7h/xNhWyUUCODyto3kcdZRDC1OTEkMrw+rvV
         n2Kf5P3kfnipktjWguX7pXemqaBH4dKC4oJYVY7Hoic0NBLv/4gz8oLIAVDqOaX/x0cB
         i7GYv2m/ayrhcug0nCYAMBoynh7RGDhP5W1RsYgAaE+h12G9e22kNWI2bo9mARYo3NS1
         zBuQ+Y8R+W6OAIYTmnNOdXkXSoNxgEMoojFc2tVf/dyu41RjWCKqu0LcFV7jghltXVim
         IQbj9e2zhwh9TpxhlWpcSj4HicYgQ6KJ0c8Xo047I6Nu0vj+CCTxdniV/sAdFs1Q+5qV
         MvhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nullptr.com; s=google; t=1792712942; x=1793317742; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hG4DQLwgfQ2Ox8LPZjYJVttUVZFQq7dsn2e6G1CsU64=;
        b=DUsWdXiNIkyonJuhc1a9JV2AS2DS3jSdzEpBPMLF+oViPS6EDcpwBfyqlKSgRtQM4s
         tkyiaVog2/s773Lw/IX2YRv20ScNRTRCFTHCeNNjcl+61hboya8bCyzXD/HPoCunr2Qa
         +zqN5cXQKyXcmK5IGADNX1+uHC3pJ4mILoBtJIeJHEzLRupW9+9F9pna3TmD1NVPev6I
         uXbFnWjUF6xiOvx/9mM14vALBaq6KUA4ejI5TdHwv4gXzopsTsxqRRjsc2Fs1VVc7NaH
         ODq9VZAVzF86yCML0svcByNH5VIC3oid9dE4ZQzyCK3GWAMPT1lBV81QGsKCCCoMfhbz
         h3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792712942; x=1793317742;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hG4DQLwgfQ2Ox8LPZjYJVttUVZFQq7dsn2e6G1CsU64=;
        b=gpbaFMGpUp5vEuXAO9fufpYZcBITb9Q9YVorDesdjCNecVLZ+2DXHRvNkZO47CirTN
         ErgGKi5iI+09oqHJNuTJQ7rbkapoz5nv405MaPdqyOzsyt8JP1zV55Y1yioAP9OWzAUX
         C5qmUQX6BmvcoOMKTPN0/SmqiaAlgyjrSGUkPOr3Dv6buMfvGTHoz0iWW9kqk0gkRIOX
         UUzzXemGJZe4F+u6hXCppacbsfMS+ndA7eCBhjps00kSwnJ0m1E30x8Gz4ErJNgqZXPx
         uZ0kqoBg1xFuBL6Jf6+Al2nn276/av9SzIamTPGN3z6vqV0Jf/ByuH9i3TYqIL4BSrl+
         dShA==
X-Gm-Message-State: AFq9FYJuGIgmutcbwP0F6KpVzwqtOLqC5704ztoIlOLfJNMF2etfi6gs
	c6sPuvv0ZLoGT11pWXEoHvhk3ZcsFx5BEPMlufAH0lJxn3F/7B7VtUDX7dLPpYl+zUChmOT5he5
	vCRl81yJidBOKpE83DhGnJtPnSwlyYjxefua3Q3mOjbCaQEe5LuWkD0bPBg==
X-Gm-Gg: AYBFou27mEKSe3y7chuic+GOly+0OZ3cyJuMC17z6NRCW/fa21KImzn20Qs/eJuvXwf
	j1d+XV7zAlBLpNo36HwSx/DzEW3dkZUCsyS6r6ihiJm39v+Ttd4sP5x82DZr42+JQgaCtcwAKLe
	EudWls1xQfJWQaqR+lDO0DPkuQ5woHzX7BQDjfFD3mf8/hmBz6+B0dGV9i70a4SRTS4NlGlXv2B
	C7pUVIwg3sHhaYm9dh5jahK0p+wjpIWjTpPWzJv91th0R6UXr1KOXdue+DU734RslB5u0S9HOFu
	JJD+/Vq3Z+XJ39m/MFED5sUuXhx6AkUNPF+wFRuDfHyBr3F1mwNcoBM6odRt3nnop1Wu4nU6jpy
	8rDjkU5qFziTeDx10/TMa8f06s26d6x28Ac0uvfWDFcxk112CTu+jHLk3aZea3NgkEXeFg6wmfO
	ah5YFPDvGH725wBbGkTGs+1JPenzS9gabcQosdo9kQ1hJZumfE1aLy
X-Received: by 2002:a05:693c:400e:b0:352:4f11:8118 with SMTP id
 5a478bee46e88-369d9898b71mr851272eec.40.1792712942467; Thu, 22 Oct 2026
 16:49:02 -0700 (PDT)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
 <20261022-xilinx-dma-work-v1-5-20faea2e7a80@nullptr.com> <sashiko-outbox-182123@kernel.org>
In-Reply-To: <sashiko-outbox-182123@kernel.org>
From: "Jeff C. Jensen" <kernel@nullptr.com>
Date: Thu, 22 Oct 2026 16:48:51 -0700
X-Gm-Features: AclHuK_tK39u8v34AT_NCdYdlPGzw2WXko96m5az-UgWvd_URdgj8AQ-VL9fGOM
Message-ID: <CAHnw2UnRtTCXuEhXacnVGQfewRQgMbakwbVrgiUvsw550i4jPQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] dmaengine: xilinx_dma: Recover a withheld AXI DMA channel
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 22:29:28 +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> What happens if terminate is called twice on a withheld channel before
> dmaengine_synchronize() runs, and the second reset times out?

[...]

> Wouldn't that cause
> xilinx_dma_recover_channel() to free chan->quarantine_list, release the
> segment reservations in chan->seg_used, and allow new transfers or
> xilinx_dma_free_chan_resources() to free chan->seg_v while the second
> hardware reset has not completed?

Checked and confirmed, I was able to recreate it on the vendor-kernel
backport with fail_function: a terminate whose reset completes, then one
whose reset fails, and synchronize puts the channel back in service.

Will fix in v2: a failed reset of a withheld channel goes back through
xilinx_dma_quarantine_channel(), which now also clears chan->quiesced,
so any failed reset cancels an earlier completed one.

> [Severity: Medium]
> Can clearing chan->quarantined = false in xilinx_dma_recover_channel()
> race with an in-flight xilinx_dma_tx_submit() that dropped chan->lock to
> run xilinx_dma_chan_reset()?

[...]

> Should xilinx_dma_tx_submit() check whether its own reset attempt failed
> rather than relying on chan->quarantined remaining true across the lock
> drop?

Correct, this should be fixed. I don't think the ring-order part can
happen, since patch 3 requires a descriptor to be submitted before the
next one is prepared. Queueing the descriptor on the recovered channel
after the terminate returned is a bug. Can fix in v2: if its own reset
failed and the channel is no longer withheld, submit cancels the
descriptor and returns the reset error.

Both issues come from the recovery this patch adds and don't exist in
1-4, which never clear chan->quarantined, so the fixes stay in 5/5 and
1-4 are unchanged.

I'll gate v2 on additional reviews to limit churn. Fixes were
straightforward.

-Jeff
