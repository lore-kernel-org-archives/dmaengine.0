Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA203E1D17
	for <dmaengine@vger.kernel.org>; Sun, 18 Oct 2026 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792357234; cv=none; b=flB0ip3KKKkCkBp8S3aIdU/YRM+ey6tERA1qbSJsk5XKueYVvxZUCg80llwE5KqgJdrMquktAa/JXPRpLihS9YcMmJ2zvNXKK//FiZuuZrJewyYM3Bdjb0Vw5W0DaGV9rOuy8QT73Hj7S9NoHYEd4Wyshbap94MClxpKrymbrrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792357234; c=relaxed/simple;
	bh=lmuebTtapyafAqg/MZz1PoSj/pPTFJ0VaRJlQ3t8Yhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DTYBDVjqLkVyR8tpqt/pxIqhsz/vW8vwLw0EOIJA4n8A7rXDvC6/dlIi8gErXF55MQfgngkMmCeRXae+EfSCKlitpHIlJJn7udoXAJ54UVwumzm5xyRhjcM+Szm2GWAACQ2nJHXkCv7/bQtSwjgHCmiyIr5BPZcGYUWiab+ZRXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtMp+ymR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtMp+ymR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6FB1F000C8
	for <dmaengine@vger.kernel.org>; Sun, 18 Oct 2026 21:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792357232;
	bh=lmuebTtapyafAqg/MZz1PoSj/pPTFJ0VaRJlQ3t8Yhg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YtMp+ymRPWyQ7hmja30jNOBaDQwwuI1782ArVM54H4yDKQ6vMlbBrHJh9/j6vMCQQ
	 kkco7+IJ6KuhBq32eHqDCuhf/pnUgjT5WjSoyw2mx1CvBY8c/O1pd7fbbu+pz8Gbpo
	 fsemPDeRIRM9iAV7f6WJTkBihbhI2yTu6UL/ipU4htWwMjc5qYWa9kme+ZCZxjvncS
	 hVbikVC+fQn1oX/BSOxrsTtOLfupRHkKOezACijZhgQ9BZ5on7HtqMMFVCLL0ENf62
	 5BSBjb3zwB53tvC7eFeQgKKS4ExHk+UfqDwodHlxgTa7+A16pPA2DcE6hO+Rince/1
	 uGyNY5Cyi87Sg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso1682320e87.0
        for <dmaengine@vger.kernel.org>; Sun, 18 Oct 2026 14:00:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByk0n8GX+yWIckg0zGm2/Ws2tABVyP7rJoyZewSEyyBhBLZMuWpY0KssofUYHF06wkfOarFYQ6ch9Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLW4SRwIsvf9ZNedzABqB+0VDfKVBunx3qj6goTTinZcrzJ3EuB
	DaU7EjynO88NjyBQ7QtHCZ/9K4v4wmLVDtvuYzw/cEr575YnDyAv2mVnPG/LzSVFnt0XMx6lqvc
	zADnDRwVT6Tjyr0N5hCLTfhCwBd1dsdU=
X-Received: by 2002:a05:6512:3d8c:b0:5b6:4ae:d87 with SMTP id
 2adb3069b0e04-5be50a655e4mr2028129e87.27.1792357231440; Sun, 18 Oct 2026
 14:00:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018040724.534641-1-yaojiale02@163.com> <20261018040724.534641-8-yaojiale02@163.com>
In-Reply-To: <20261018040724.534641-8-yaojiale02@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 18 Oct 2026 23:00:17 +0200
X-Gmail-Original-Message-ID: <CAD++jL=DqXggfdAq6yU8=OBm5atks77CcQ4AnuR9RcAS6QQsrg@mail.gmail.com>
X-Gm-Features: AclHuK-3fui0U03t7CAaiKHddUwpmQ1nyZ2GG7y4wk-UNeVfMtV2nvH5lucn1Ag
Message-ID: <CAD++jL=DqXggfdAq6yU8=OBm5atks77CcQ4AnuR9RcAS6QQsrg@mail.gmail.com>
Subject: Re: [PATCH 7/7] dmaengine: ste_dma40: synchronize tasklet when
 releasing a channel
To: Jiale Yao <yaojiale02@163.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Dan Williams <djbw@kernel.org>, Srinidh Kasagar <srinidhi.kasagar@stericsson.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 6:07=E2=80=AFAM Jiale Yao <yaojiale02@163.com> wrot=
e:

> DMA completion handling schedules a per-channel tasklet that processes
> completed descriptors and invokes client callbacks. Channel release
> terminates and frees the descriptor state without draining a tasklet
> that was already queued.
>
> After d40_free_dma() removes the channel from the interrupt lookup
> tables, kill the tasklet before returning the channel to the DMAengine
> core.
>
> Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3"=
)
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

This makes sense.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
