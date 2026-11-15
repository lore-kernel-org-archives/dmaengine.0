Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794782562;
	b=S2EFihOnxYYD+tT+MJLoxKb6sgNCvG+tkPz7WLv/dYWBF21Y+rjjk7NsQJ4QcsiK5mcV
	 LUUc/3JTGuYZxnevax7ISG78xGcLzfikjbxWUTvJr/1P/2+HjYuWUiH0bkKsbNbB3Mdfc
	 v7TnKg4jJ67DSHDYrfiBubNYSAtkwrgiSwZ3AULWecSl0H49ARMeSkLy/XyJTZbB2e2Yy
	 7QfZnLKzEVzbiEzJHNEc7yX+2tBE+n7jF+WgauntJ3/h4GNynJtn60822WqOmktnWBAjL
	 KO+fznZp+8SNGHJhR0kVDvDSPuNf9hXl/wNnlY+DNlqXff2QqcOa/b9PTbnuq+9daug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782562;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=OY/vmsGvuE6qxS/RSSUMX1YER6MAYsfGCerq4d6P+iA=;
	b=vakmt3LuRX1jF1CTiDiVUsGonnoItUVoMNRuruubI8X+oMU4KKT88ccew+ZFefk3SmHr
	 2ruPA0iVGTb117PUeK37ItYjnw9W6Ui0cPHMsD+SwwMnLDY6W5f5QN9XOvRfy2ebqbKx1
	 jpN+kD1ernR2bdOPMs5AisRrNzz3dFzlsmHYcjSKzFD++tJo08Q+uc1RqsgcSpQBNTbqI
	 GwUgKK3K7Qkujhse4bb/LTWAiFaAIIlHK5uhaNU2SzxBNsb6srJIEO02KQSU8DaIA7hw2
	 p/hP80L2IPuaXYzxaXxA1loIZ2h/sNQKM9YbOb6HoXq8ufjsNmQ38nVT8pOSbdgA3PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fj5MKpku;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BCB606A330
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 22:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fj5MKpku
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CC81F000C7
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 22:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794782562;
	bh=OY/vmsGvuE6qxS/RSSUMX1YER6MAYsfGCerq4d6P+iA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Fj5MKpkusz0IiOeMG+iVIo5CPD2UqCc+4Kkvwn3ZY00ghWrkcDQtnMPIxmq2ABaWD
	 lcFivo+8qaDZINUhu2bHOhhE9AykX7+8w6yDqjrpkBfAr03T12yhWKCeJ0MmAiw6U/
	 32YxcSRJDUiE9eElp1w2N6JTm4DTyQB7C6/1GkWZ69PC9OJrz8DSBk7aVFoscWviXr
	 kCgvfBmAjU8/rGtI+T4kUrLpYdOyHU/eE1pn8MYKnMzWlJ2+ec/5j3Hh9dJeFXRLmi
	 srjeISKHwPQ2Fn1bE5V2+qIYkxYp++yuSqoaECshiYEJ5OsaEqmkZRX8qFXHhaYWs3
	 qZY5gOXCI5xyg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso1986018e87.0
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 14:42:42 -0800 (PST)
X-Gm-Message-State: APuU4Z/V8j3Qren3uJKpzktIsqMYoRooFqBY3hU9niZ+0Tfv0DqWlbvt
	swyVka9QPmT84cablkdhBL9qfAlCy6CWJ0X0Opeeidygsf840Uk5vy8oepEr7bzbRlCU1cCpoi9
	CM6RQ4VpBdcObvAbxXTu04KuHcT2vESs=
X-Received: by 2002:a05:6512:234a:b0:5c1:445e:2807 with SMTP id
 2adb3069b0e04-5c170b3659cmr3051929e87.39.1794782561084; Sun, 15 Nov 2026
 14:42:41 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-ux500-dma40-powerdomain-v1-1-da8b6e1a0376@kernel.org> <sashiko-outbox-215867@kernel.org>
In-Reply-To: <sashiko-outbox-215867@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 15 Nov 2026 23:42:27 +0100
X-Gmail-Original-Message-ID: <CAD++jL=m+wQ6jTqZSppytMqNhcRWxg0-dtHHvnCtK2Q_xqOH8g@mail.gmail.com>
X-Gm-Features: Aa3M54qCyDuSMtgjBtSX2wm5UZXOAXKnBhEik4sOlFS4i30gKXwYVz5QBM8eGoA
Message-ID: <CAD++jL=m+wQ6jTqZSppytMqNhcRWxg0-dtHHvnCtK2Q_xqOH8g@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: ste_dma40: Use power domain for LCLA SRAM
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:41=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dmaengine: ste_dma40: chained dev_err_probe() in d40_probe()
>   clobbers reason

Nah. Too small issue, no-one cares.

> It also noticed 2 related pre-existing issues this patch does not
> introduce:
> - [Critical] dmaengine: ste_dma40: use-after-free in d40_free_dma() [1]
> - [Critical] dmaengine: ste_dma40: DMA API bypass in d40_lcla_allocate()
>   [2]

I am happy to start working on these *IN PARALLEL*, with this
patch as a prerequisite.

Given how much perpetual churn Sashiko gives rise to I would
prefer not to get that mixed in with this one important patch.

Yours,
Linus Walleij
