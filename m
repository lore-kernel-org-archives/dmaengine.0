Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FC43905E6
	for <dmaengine@vger.kernel.org>; Tue,  6 Oct 2026 06:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791266530; cv=none; b=KsROP5+5aGdXhnZHNPGsbPC/ykdW5h9k4qYedDLv6BRgUBkfrNEB06AbTWiDeBzqGG9FTl1PgMvZHifpEnPyhuS+StenOz3CRTC3utLX2Xvaa3TRpBREkei/m/aHb8q5EOFhCCkzGN5/0y20/8Hg38xyhwExSH6lp8l7gaswZz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791266530; c=relaxed/simple;
	bh=dR8Qutpl2FyesqtcpPHIrzvBeE1WogkEGbe/5zasnK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=leEiQ4fE6sXeOFy0UGyTzpNx4P1ppb3hs5ZolvHieove/g85BGK1zfRmaJOG05FFuMpMRWDWCEwq2NelZ6wNmf00RKQXBtG4CsN1ShtZ3GhwvIogo0bEspR9NjgBQ4shGTDS6zefBF5EokkP+OZ5CzKFJW8UGynw0kDtAQt16Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsBRq9EB; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsBRq9EB"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1438d9363fbso628573c88.0
        for <dmaengine@vger.kernel.org>; Mon, 05 Oct 2026 23:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791266528; x=1791871328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dR8Qutpl2FyesqtcpPHIrzvBeE1WogkEGbe/5zasnK0=;
        b=GsBRq9EBlh+sIzt9KRSUZKSZWXAnJl0/haxyn/Jw7higFIWKPiaO/yFhfNyvIfnUV8
         rXB9QLzx6IA+BA4aosx58m+mOuLjJk8e5NHZIqZlHhS7wsv5qROY8zdm7/fT4TTmzuih
         SP+QmJvQg+E5ff/UlMPrKWqmLfZzyU/fiCRB/4fqTdQ3LqXiZ1NZYYvSqpK9GGiAzslZ
         rfKgsIxpNWNUvkWaMdGMK2UQImbX69OPS7Y/tDZZqNmCaVHBBQJ90kRAf1hIVPYHu/LB
         1U2RoUS1M154IcNNH7zpTELajRpcYIiP01VMEenKcrG/eKZlnpp1mrfxpI1q1glKWsmi
         UXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266528; x=1791871328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dR8Qutpl2FyesqtcpPHIrzvBeE1WogkEGbe/5zasnK0=;
        b=Vz//VeKKgLFPNYyhxhiK05FAD/3goAwMl+hVeRCmneHVVGauzWEihZmLCZgWuA3zVI
         cacynm20kHm04gYFX46t0zKCLL2Xep/6oqzEB7uW6h0IjOB5sTdvRrdAGR/bSm+Jsh19
         1a8+cfcE1I7YrE6+LIRFrUs/bYWhYLVVAHk9GVn9A+7eDu27akQ1ZffZjCErlNi0iezD
         yUjtn4I2oAPn1M+UJpxaOYS/9ltXYgrpw7OI4HRL6xMbHEwe2Twvh6Lt2FQ+80zYZfx0
         Wegdszit5xUX4mSkq8Ll4Ag3zYhiw2HvIsu8jyPD+DUEOeU+QdAJTIVGamAF5ACPhfQL
         G6bg==
X-Forwarded-Encrypted: i=1; AKwUvByqUNvqjPSkMKpXzajwSV7+uSqxxE2BlMSdC28LxzdYqpYIhJ/c57OxO2ZLGdarrcrUx+TI/jvMuxQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4eOmLm3CkTn96MVW54N3eBZCUnGJ0NLJOFzOdld7P3ga2nQIn
	4Z0Q6MrH7TuqV3W3nDLkF2buEwkdMIOdZiXUDDGmLEBI27ew8NJpGm1c
X-Gm-Gg: AYBFou0e6BQDsEFdIUspFlZxW1VoJOln695bZD1hOnEHy3ULrtfX64BJx70Lqct2pao
	XcnDtxrLml/jMMmOFJ0mRCFT4SheclRi+fzxmw5FyWvCLriOldUU0d++HUHi8lrzhpU5nVrFT2H
	4FpTfT8rd2tM8L+Ym+eUt2w8PcC2M7r/NxrtYiQFWftjVWFRTps+63MDzLg8kZ3GXISesgVTlEJ
	hZrX8uVsxng62wF7DizbVOTKZK3HrfGuU4T6THS0EPLKUbJKA1NJdbWBvE4S2cu5VXVrQ6VoQK0
	1mwmnVnPRLKCU/dxXA8ngYx/jUUlD6obX2tZdw8tJBkgH0hrVREETbnPopSFf7nQIxMLZYblA8S
	mmCLKiJz19XMWQfjwjossiNo9VEZwvcMIUSERcE3lQpAMCRlH548eGD9Dr+0OwC8dcnLgcZSftd
	WdZ3GbVex1HS7ibw6D6BOMUEJdNJeFieUmcrVlCIklnI0/jUyjkAivAxxCRW6C8+vwidPJkjPHS
	s6WJVzTNFJb7sODBSYRuL0=
X-Received: by 2002:a05:7022:439a:b0:14a:6a66:f6e3 with SMTP id a92af1059eb24-15d302eb7d5mr2994502c88.20.1791266528379;
        Mon, 05 Oct 2026 23:02:08 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d84523b6csm3799091c88.12.2026.10.05.23.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:02:07 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Frank Li <Frank.li@oss.nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dmaengine: fix typos in comments
Date: Tue,  6 Oct 2026 11:32:02 +0530
Message-ID: <20261006060202.45817-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <asOtEhjOMXc9SVNP@parshuram>
References: <20260907063343.22255-1-hemanth.selam@gmail.com> <asOtEhjOMXc9SVNP@parshuram>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 05, 2026 at 07:28:42PM +0530, Vinod Koul wrote:
> This is bogus, pls drop these... If there are real typos pls fix those
> instead! This is not a language book, it is code, upto should be just
> fine!

Understood, dropping this one.

For what it is worth, one hunk in it was not an "upto" style change:
drivers/dma/ppc4xx/xor.h has "contoller" where "controller" is meant.
If you would still take that on its own I will send it as a separate
one-line patch; otherwise I will leave it be.

Sorry for the noise.

Thanks,
Hemanth
